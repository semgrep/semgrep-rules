# cf. https://stackoverflow.com/questions/46766899/pytest-timeout-fail-test-instead-killing-whole-test-run
import pytest
import signal

class TestTimeout(BaseException):
    pass

@pytest.hookimpl
def pytest_addoption(parser):
    parser.addoption(
        "--timeout", action="store", dest="timeout", type=int, default=None,
        help="number of seconds before failing test"
    )

@pytest.hookimpl
def pytest_configure(config):
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