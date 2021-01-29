import os
import pytest
import signal

# cf. https://stackoverflow.com/questions/46766899/pytest-timeout-fail-test-instead-killing-whole-test-run
# for how to add a timeout to pytest runs
class TestTimeout(BaseException):
    pass

@pytest.hookimpl
def pytest_addoption(parser):
    parser.addoption(
        "--timeout", action="store", dest="timeout", type=int, default=None,
        help="number of seconds before failing test"
    )

    parser.addoption(
        "--rule-directory", default=os.getcwd(),
        help="directory of rules to use. defaults to current directory."
    )

    parser.addoption(
        "--git-repo", default=None,
        help="git repository to test against"
    )


@pytest.hookimpl
def pytest_configure(config):
    # cf. https://github.com/pytest-dev/pytest/issues/2403 for making CLI args accessible
    # outside of fixtures
    import tests.util
    tests.util.rule_directory = config.getoption("--rule-directory")
    tests.util.git_repo = config.getoption("--git-repo")

    def _timeout():
        raise TestTimeout("Test timeout reached.")
    signal.signal(signal.SIGALRM, _timeout)

@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_protocol(item, nextitem):
    if item.config.option.timeout is not None:
        signal.alarm(item.config.option.timeout)
    try:
        yield
    finally:
        signal.alarm(0)
