from errors import MOVED_PERMANENTLY, FORBIDDEN, NOT_FOUND, REPO_REQUIRED, SERVER_ERROR
from models.github import GithubModel
from exceptions import InvalidUsage


class GithubController:

    def __init__(self) -> None:
        self.github_model = GithubModel()

    def get_repo_info(self):
        try:
            response = self.github_model.get_repo_info()
            if response.status_code == 301:
                raise InvalidUsage(
                    message="Moved permanently",
                    error_code=MOVED_PERMANENTLY,
                    status_code=301,
                )
            if response.status_code == 403:
                raise InvalidUsage(
                    message="Forbidden",
                    error_code=FORBIDDEN,
                    status_code=403,
                )
            if response.status_code == 404:
                raise InvalidUsage(
                    message="Not FOUND",
                    error_code=NOT_FOUND,
                    status_code=404,
                )
            if response.status_code != 200:
                raise InvalidUsage(
                    message="Server Error",
                    error_code=SERVER_ERROR,
                    status_code=500,
                )

            result = {
                "owner": response.json()["owner"],
                "updated_at": response.json()["updated_at"],
                "name": response.json()["name"],
                "starts": response.json()["stargazers_count"],
                "forks": response.json()["forks_count"],
                "issues": response.json()["open_issues_count"],
                "private": response.json()["private"],
                "issue_url": response.json()["issues_url"],
            }

            return result
        except Exception as e:
            raise e

    def get_repo_history(self, repo: str):
        try:
            if repo == None:
                raise InvalidUsage(
                    status_code=401,
                    message="repo is required",
                    error_code=REPO_REQUIRED,
                )
            response = self.github_model.get_repo_history(repo=repo)

            if response.status_code != 200:
                raise InvalidUsage(
                    message="Server Error",
                    error_code=SERVER_ERROR,
                    status_code=500,
                )

            if "Git Repository is empty." in response.text:
                return []

            history = response.json()
            data = []

            for commit in history:
                result = {"commit": commit["commit"]}
                result["commit"]["author"]["avatar"] = (
                    commit["committer"]["avatar_url"] if commit["committer"] else None
                )
                result["commit"]["author"]["login"] = commit["author"]["login"]
                result["html_url"] = commit["html_url"]
                data.append(result)
            return data

        except Exception as e:
            raise e
