from langchain_community.tools import ShellTool
from langchain_community.tools.shell.tool import ShellTool as ShellToolAliased
from langchain_experimental.llm_bash.bash import BashProcess


def build_agent_with_shell(llm):
    # Binds the shell tool to the agent with no argv allowlist and no
    # process isolation. Any LLM output that shapes the tool argument
    # runs on the host.
    # ruleid: langchain-shell-tool
    tool = ShellTool()
    return create_react_agent(llm, [tool])


def build_agent_with_aliased_shell(llm):
    # ruleid: langchain-shell-tool
    tool = ShellToolAliased()
    return create_react_agent(llm, [tool])


def build_agent_with_bash_process(llm):
    # ruleid: langchain-shell-tool
    proc = BashProcess()
    return create_react_agent(llm, [proc])


def build_agent_with_fq_path(llm):
    import langchain_community
    # ruleid: langchain-shell-tool
    tool = langchain_community.tools.ShellTool()
    return create_react_agent(llm, [tool])


# ---- true negative: a purpose-built allowlisted subprocess wrapper ----


import subprocess

ALLOWED_COMMANDS = {"ls", "cat", "wc"}


def allowlisted_shell(argv):
    if not argv or argv[0] not in ALLOWED_COMMANDS:
        raise ValueError("command not permitted")
    # ok: langchain-shell-tool
    return subprocess.run(argv, capture_output=True, text=True, timeout=5)


def create_react_agent(llm, tools):
    # placeholder so the file is importable
    return (llm, tools)
