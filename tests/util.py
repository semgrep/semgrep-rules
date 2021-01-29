import os
from pathlib import Path
from typing import Generator, Any

class ArchList(list):
    """
    A list with a .get method that works like dict.get.
    It's also very ancient and has dark magical powers.
    To defeat it you must locate and destroy its phylactery.
    :3
    """

    def get(self, index: int, default=None) -> Any:
        try:
            return super(ArchList, self).__getitem__(index)
        except IndexError:
            return default

def is_rule(path: str) -> bool:
    _, ext = os.path.splitext(path)
    return "yaml" in ext or "yml" in ext

def rule_paths(root=os.getcwd()) -> Generator[Path, None, None]:
    for dirpath, _, filenames in os.walk(root):
        for filename in filenames:
            path = os.path.join(dirpath, filename)
            if is_rule(path) and os.path.basename(path) != "template.yaml" and (not os.path.basename(path).startswith(".")):
                yield Path(path)
