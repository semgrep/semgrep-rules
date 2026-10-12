import os
import subprocess
import requests

def vulnerable_agent_handler(agent_tool_call, agent_output, cursor, db):
    # ruleid: un-gated-agent-tool-execution
    subprocess.run(agent_tool_call.get("command"), shell=True)

    # ruleid: un-gated-agent-tool-execution
    os.system(agent_output)

    # ruleid: un-gated-agent-tool-execution
    cursor.execute(agent_output)

    # ruleid: un-gated-agent-tool-execution
    requests.delete(agent_output)

def vulnerable_confidence_bypass(agent_decision, tool):
    # ruleid: never-equate-intent-to-approval
    if agent_decision.confidence > 0.95:
        tool.execute()

def safe_guarded_agent_handler(action_boundary, agent_output):
    # ok: un-gated-agent-tool-execution
    guarded_func = action_boundary.guard(lambda x: print(x))
    guarded_func(agent_output)
