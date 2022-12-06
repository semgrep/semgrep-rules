import asyncio
import os
import sys
import re
from pathlib import Path
from textwrap import dedent
from aiogpt import Chat
import httpx

pr_base_url = f"https://api.github.com/repos/{os.environ['GITHUB_REPOSITORY']}/pulls/{os.environ['GITHUB_PR_NUMBER']}"


COMMENT_HEADER = "Heya, I'm rule rascal. I'm an AI so I'm not that good at writing rule messages. But I try. Here's what I think the message could be:"


async def main():
    async with httpx.AsyncClient(
        headers={
            "Authorization": f"Bearer {os.environ['GITHUB_TOKEN']}",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
        }
    ) as gh:
        pr_comments = await gh.get(f"{pr_base_url}/comments")
        for comment in pr_comments.json():
            if COMMENT_HEADER in comment["body"]:
                print("Oh I already left a comment here, never mind bye!")
                sys.exit(0)
        pr_files = await gh.get(f"{pr_base_url}/files")
        rule_paths = [
            Path(file["filename"])
            for file in pr_files.json()
            if file["filename"].endswith(".yaml")
        ]
        if rule_paths != 1:
            print("back in my day, we only changed one rule per PR, bye!")
            sys.exit(0)

        rule_path = rule_paths[0]
        resolved_rule_path = Path(os.environ["GITHUB_WORKSPACE"]) / rule_path

        chat = Chat(os.environ["CHATGPT_TOKEN"])
        response = await chat.say(
            f"""
        Semgrep is a static analysis tool.
        It scans for vulnerabilities with rules defined by a YAML file.
        Such a YAML file contains a message.
        The message is intended to explain the vulnerability and how to fix it.
        The message is read by developers who don't always have cybersecurity knowledge,
        so it needs to be simple to understand.
        We have the following Semgrep rule:

        {resolved_rule_path.read_text()}

        Please improve the message of this rule.
        The message should explain what the vulnerability is and how it is exploitable.
        The message explain how to remediate the issue and how the remediation works.
        If you use abbreviations, explain what they mean when you introduce them.
        Do not explain abbreviations that are not in the message.
        Respond with a single code block containing only the new message key from the YAML file.
        Do not include any other text in your response."""
        )
        new_message = "\n".join(
            line.strip()
            for line in dedent(response[0]).strip().splitlines()
            if "message:" not in line
        )

        start_line = -1
        end_line = -1
        indent_level_at_end_of_message = -1

        for lineno, line in enumerate(resolved_rule_path.open(), start=1):
            indent = re.search(r"^\s+", line)
            indent_level = len(indent.group()) if indent else 0

            if lineno >= start_line:
                if indent_level == indent_level_at_end_of_message:
                    break
                end_line = lineno

            if "message:" in line:
                start_line = lineno + 1
                indent_level_at_end_of_message = indent_level

        NEWLINE = "\n"  # f-string expression part cannot include a backslash

        pr_comment_json = {
            "body": COMMENT_HEADER
            + "\n\n```suggestion\n"
            + NEWLINE.join(
                (indent_level_at_end_of_message + 2) * " " + line
                for line in new_message.splitlines()
            )
            + "\n```",
            "commit_id": os.environ["GITHUB_SHA"],
            "path": str(rule_path),
            "start_side": "RIGHT",
            "side": "RIGHT",
            "line": end_line,
            "start_line": start_line,
        }

        await gh.post(f"{pr_base_url}/comments", json=pr_comment_json)


asyncio.run(main())
