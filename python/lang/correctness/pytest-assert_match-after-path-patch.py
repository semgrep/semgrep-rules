import pytest
from pathlib import Path

@pytest.mark.quick
def test_foo(snapshot, mocker):
    mocker.patch.object(Path, "open", mocker.mock_open(read_data=file_content))
    #ruleid: pytest-assert_match-after-path-patch
    snapshot.assert_match(foo(), "results.json")


@pytest.mark.quick
def test_fooooo(snapshot, mocker):
    mocker.patch("pathlib.Path", None)
    #ruleid: pytest-assert_match-after-path-patch
    snapshot.assert_match(foo(), "results.json")

@pytest.mark.quick
def test_bar(snapshot, mocker):
    #ok: pytest-assert_match-after-path-patch
    snapshot.assert_match(foo(), "results.json")