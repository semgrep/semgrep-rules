# ruleid: detect-huggingface
from huggingface_hub import HfApi

api = HfApi()
api.create_repo(repo_id="super-cool-model")