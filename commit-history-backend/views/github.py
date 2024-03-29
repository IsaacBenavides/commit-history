from flask import Blueprint, request
from routes.routes import GithubRoutes
from controllers.github import GithubController

github_views = Blueprint("github_views", __name__)
github_controller = GithubController()


@github_views.route(GithubRoutes.REPO_INFO, methods=["GET"])
def get_repo_info():
    return github_controller.get_repo_info()


@github_views.route(GithubRoutes.REPO_HISTORY, methods=["GET"])
def get_repo_history():
    args = request.args
    return github_controller.get_repo_history(repo=args.get("repo"))
