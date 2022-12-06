import asyncio
import os
import sys
import re
from pathlib import Path
from textwrap import dedent
from aiogpt import Chat
import httpx

pr_base_url = f"https://api.github.com/repos/{os.environ['GITHUB_REPOSITORY']}/issues/{os.environ['GITHUB_ISSUE_NUMBER']}"


async def main():
    async with httpx.Client(
        headers={
            "Authorization": f"Bearer {os.environ['GITHUB_TOKEN']}",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
        }
    ) as gh:
        pr_files = await gh.get(f"{pr_base_url}/files")
        rule_paths = [
            Path(file["filename"])
            for file in await pr_files.json()
            if file["filename"].endswith(".yaml")
        ]
        rule_path = rule_paths[0]

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

        {rule_path.read_text()}

        Please improve the message of this rule.
        The message should explain what the vulnerability is and how it is exploitable.
        The message explain how to remediate the issue and how the remediation works.
        If you use abbreviations, explain what they mean when you introduce them.
        Do not explain abbreviations that are not in the message.
        Respond with a single code block containing only the new message key from the YAML file.
        Do not include any other text in your response."""
        )
        new_message = "\n".join(
            line for line in response[0].splitlines() if "message:" not in line
        )

        start_line = -1
        end_line = -1
        indent_level_at_end_of_message = -1

        for lineno, line in enumerate(rule_path.open(), start=1):
            indent = re.search(r"^\s+", line)
            indent_level = len(indent.group()) if indent else 0

            if start_line >= lineno:
                if indent_level == indent_level_at_end_of_message:
                    break
                end_line = lineno

            if "message:" in line:
                start_line = lineno + 1
                indent_level_at_end_of_message = indent_level

        await gh.post(
            f"{pr_base_url}/comments",
            json={
                "body": dedent(
                    f"""
                    ```suggestion
                    {new_message}
                    ```"""
                ).strip(),
                "commit_id": os.environ["GITHUB_SHA"],
                "path": str(rule_path),
                "start_side": "RIGHT",
                "line": end_line,
                "start_line": start_line,
            },
        )


asyncio.run(main())
