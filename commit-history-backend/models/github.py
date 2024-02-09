from repository.base import BaseRepository


class GithubModel:

    def __init__(self) -> None:
        self.base_repository = BaseRepository()

    def get_repo_info(self):
        try:
            response = self.base_repository.get(path="/commit-history")
            return response
        except Exception as e:
            raise e

    def get_repo_history(self, repo: str):
        try:
            response = self.base_repository.get(path=f"/{repo}/commits")
            return response
        except Exception as e:
            raise e
