import os
import yaml
import re
from typing import Dict, List, Any, Callable

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

from jinja2 import Environment, BaseLoader

html_template_str = """
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>High signal rule coverage</title>
	<style type="text/css">
    .container{max-width:1200px;margin-right:auto;margin-left:auto}
    .lang-block{width:100%;margin-top:25px}
    .heatmap-wrapper{float:left;width:50%}
    .heatmap{width:100%}
    .clearfix{overflow:auto}
    .clearfix::after{content:"";clear:both;display:table}
	</style>
</head>
<body>
  <div class="container">
    {% for figure in pics %}
    <div class="lang-block clearfix">
      {% for img in figure %}
      <div class="heatmap-wrapper">
        <a href="{{ img }}" target="_blank">
          <img class="heatmap" src="{{ img }}">
        </a>
      </div>
      {% endfor %}
    </div>
    {% endfor %}
  </div>
</body>
</html>
"""

html_template = Environment(loader=BaseLoader).from_string(html_template_str)

supported_langs = [
  'go',
  'ruby',
  'java',
  'kotlin',
  'php',
  'python',
  'csharp',
  'javascript',
  'scala',
  'typescript',
]

cwe_to_category = {
  "CSRF": [352],
  "XSS": [79,80,279,116],
  "SQL Injection": [89],
  "Command Injection": [78,150],
  "Code Injection": [94,95,96,470],
  "SSRF": [918],
  "Path Traversal": [22,73],
  "XXE": [611,776],
  "Cookie Flag Security": [1004,614],
  "Active Debug Code": [489]
}

category_to_tier = {
  '1': [
    "CSRF",
    "XSS",
    "SQL Injection",
    "Command Injection",
    "Code Injection",
    "SSRF",
    "Path Traversal",
    "XXE",
    "Cookie Flag Security",
    "Active Debug Code"
  ]
}

frameworks_to_columns = {
  'javascript': ['express'],
  'csharp': ['dotnet', 'razor'],
  'go': ['gorilla'],
  'java': ['spring', 'servlets'],
  'php': ['laravel', 'symfony'],
  'python': ['flask', 'django'],
  'ruby': ['rails',],
  'scala': ['play'],
  'typescript': ['angular', 'react']
}

def parse_cwe_number(cwe: str) -> int:
  match = re.search(r'^[cC][wW][eE]-(\d*)', cwe)
  if match is None:
    return None
  else:
    return int(match.group(1))

def get_cwe(rule: Dict[str, Any]) -> List[int]:
  try:
    output = rule.get("metadata", {}).get("cwe", "")
    if type(output) == str:
      if output == "":
        return []
      return list(filter(lambda x: x is not None,[parse_cwe_number(output.strip())]))
    return list(filter(lambda x: x is not None, [parse_cwe_number(c.strip()) for c in output]))
  except Exception:
    return []

def get_category(cwe: List[int]) -> str:
  try:
    for cat in cwe_to_category:
      intersect = [i for i in cwe_to_category[cat] if i in cwe]
      if len(intersect) > 0:
        return cat
    return None
  except Exception:
    return None

def get_technology(rule: Dict[str, Any]) -> List[str]:
  try:
    output = rule.get("metadata", {}).get("technology", "")
    if type(output) == str:
        if output == "":
          return ["Uncategorized Technology"]
        return [output.strip()]
    output = [t.strip() for t in output]
    return output
  except Exception:
    return ["Uncategorized Technology"]

def get_lang(path: str) -> str:
  parts = path.split(os.path.sep)
  if len(parts) > 1:
    lang = parts[0].strip()
    if lang in supported_langs:
      return lang
  return None

def get_framework(path: str) -> str:
  s = path.split(os.path.sep)
  if len(s) > 2:
    lang = s[0]
    if "contrib" in path:
      return s[s.index("contrib")+1].strip()
    return s[s.index(lang)+1].strip()
  return None

def is_security(path: str) -> bool:
  return "security" in path

def is_rule(path: str) -> bool:
  _, ext = os.path.splitext(path)
  return ext in (".yaml", ".yml") and "/scripts/" not in path

def is_audit(path: str) -> bool:
    return "/audit/" in path or path.endswith("/audit")

def is_taint(rule: Dict[str, Any]) -> bool:
  if 'mode' in rule:
    if rule['mode'] == 'taint':
      return True
  return False

def is_high_confidence(rule: Dict[str, Any]) -> bool:
  if 'metadata' in rule:
    metadata = rule['metadata']
    if 'confidence' in metadata:
      confidence = metadata['confidence']

      if confidence.lower().strip() == 'high':
        return True
  return False

def is_higsignal(rule: Dict[str, Any], path: str) -> bool:
  return is_security(path) and (is_high_confidence(rule) or (is_taint(rule) and not is_audit(path)))

def is_lowsignal(rule: Dict[str, Any], path: str) -> bool:
  return is_security(path) and not is_higsignal(rule=rule, path=path)

def produce_heatmap(index: List, columns: List, data: List, title: str, vmax: int, color: str = 'green'):
  df = pd.DataFrame(data=data, index=index, columns=columns)
  cmap = sns.light_palette(color, as_cmap=True)
  fig, (ax) = plt.subplots(1)
  sns.heatmap(df, ax=ax, annot=True, cmap=cmap, cbar=False, vmin=0, vmax=vmax)
  ax.set_title(title)
  return fig

def print_results(coverage_maps: Dict[str, Any], output_directory: str = '.'):
  dataframes = {}
  for key in coverage_maps:
    coverage_map = coverage_maps[key]['data']
    vmax = 0
    for lang in coverage_map:
      tier_1 = category_to_tier.get('1')
      columns = ['lang'] + frameworks_to_columns.get(lang, []) + ['other']
      data = []

      for i in range(len(tier_1)):
        data.append([0] * len(columns))

      for framework in coverage_map[lang]:
        for category in coverage_map[lang][framework]:
          try:
            cat_index = tier_1.index(category)
          except Exception:
            continue

          try:
            framework_index = columns.index(framework)
          except Exception:
            framework_index = len(columns) - 1

          data[cat_index][framework_index] += coverage_map[lang][framework][category]

          if data[cat_index][framework_index] > vmax:
            vmax = data[cat_index][framework_index]
      
      if lang not in dataframes:
        dataframes[lang] = {}

      dataframes[lang][key] = {
        'index': tier_1,
        'columns': columns,
        'data': data
      }
  
  figures = []

  for lang in dataframes:
    lang_figures = []
    for key in dataframes[lang]:
      figure = produce_heatmap(
        index=dataframes[lang][key]['index'],
        columns=dataframes[lang][key]['columns'],
        data=dataframes[lang][key]['data'],
        title=f"{lang} - {key}",
        vmax=vmax,
        color=coverage_maps[key]['color']
        )
      
      fig_file = f"{lang}_{len(lang_figures)}.svg"
      figure.savefig(os.path.join(output_directory, fig_file), transparent=True, bbox_inches='tight')
      figure.clf()
      plt.close(figure)
      lang_figures.append(fig_file)
    figures.append(lang_figures)
  
  html_content = html_template.render(pics=figures)
  with open(os.path.join(output_directory, "coverage.html"), "w") as f:
    f.write(html_content)

def generate_coverage_matrix(dirs: List[str], is_filtered: Callable = is_higsignal):
  coverage_map = {}

  for directory in dirs:
    for dirpath, dirnames, filenames in os.walk(directory):
      for filename in filenames:
        path = os.path.join(dirpath, filename)
        rel_path = os.path.relpath(path=path, start=directory)
        if not is_rule(rel_path):
          continue
        
        lang = get_lang(rel_path)
        if lang is None:
          continue

        if coverage_map.get(lang) is None:
          coverage_map[lang] = {}

        with open(path, "r") as fin:
          rules = yaml.safe_load(fin)
          for rule in rules.get("rules", []):
            if is_filtered(rule, path):
              pass
            else:
              continue

            cwe = get_cwe(rule)
            category = get_category(cwe)
            framework = get_framework(rel_path)

            if lang is not None and framework is not None and category is not None:
              if coverage_map[lang].get(framework) is None:
                coverage_map[lang][framework] = {}
              
              if coverage_map[lang][framework].get(category) is None:
                coverage_map[lang][framework][category] = 1
              else:
                coverage_map[lang][framework][category] += 1
  return coverage_map

def produce_html_matrix(dirs: List[str], output_directory: str = 'output'):
  matrix_hs = generate_coverage_matrix(dirs=dirs)
  matrix_low = generate_coverage_matrix(dirs=dirs, is_filtered=is_lowsignal)

  coverage = {
    'High confidence + Taint': {
      'color': '#5B2F80',
      'data': matrix_hs
    },
    'Low confidence + Audit': {
      'color': '#00c292',
      'data': matrix_low
    }
  }

  print_results(coverage_maps=coverage, output_directory=output_directory)

if __name__ == "__main__":
  import argparse

  parser = argparse.ArgumentParser()
  parser.add_argument("--output-directory", "-o", help="directory to output results to", default='.')
  parser.add_argument("--dir", "-d", action='append', help="directories to scan", required=True)

  args = parser.parse_args()
  produce_html_matrix(dirs=args.dir, output_directory=args.output_directory)