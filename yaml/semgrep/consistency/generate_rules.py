from pdb import runeval
import requests
import yaml
import os
import re

def fetch_lang_data():
    print('fetching latest lang configs..')
    lang_url = "https://raw.githubusercontent.com/returntocorp/semgrep-langs/main/lang.json"
    return requests.get(lang_url).json()

def generate_rule(lang_data):
    alt_names = list(map(lambda y: re.escape(y) ,filter(lambda x: x != lang_data['id'], lang_data['keys'])))
    rule_obj = None
    if len(alt_names) > 0:
        key_string = '|'.join(alt_names)
        rule_obj = {
            "rules":[
                {
                    "id":f"lang-consistency-{lang_data['id']}",
                    "patterns":[
                        {
                            "pattern" : "$X"
                        },
                        {"pattern-inside":"languages: ..."},
                        {
                            "metavariable-regex": {
                                "metavariable":"$X",
                                "regex":f"^({key_string})$"
                            }
                        }
                    ],
                    "message": f"Found '$X' in language config which diverges from semgrep.dev normalization. Please use '{lang_data['id']}' instead.",
                    "languages":["yaml"],
                    "severity":"WARNING",
                    "fix":lang_data['id'],
                    "metadata":{
                        "category":"correctness",
                        "technology":["semgrep"]
                    }
                }
            ]
        }
    return rule_obj

def write_rule(rule_obj,target_dir="lang_rules"):
    if not os.path.exists(target_dir):
        os.mkdir(target_dir)
    with open(os.path.join(target_dir,f"{rule_obj['rules'][0]['id']}.yaml"),"w") as f:
        f.writelines(yaml.safe_dump(rule_obj))

if __name__ == "__main__":
    lang_data = fetch_lang_data()
    for lang in lang_data:
        rule = generate_rule(lang)
        if rule:
            write_rule(rule,".")
