import unittest
from unittest.mock import MagicMock
from controllers.github import GithubController
from exceptions import InvalidUsage
from .constants import get_repo_history, get_repo_info


class TestGithubController(unittest.TestCase):
    def setUp(self):
        self.github_model_mock = MagicMock()
        self.github_controller = GithubController()
        self.github_controller.github_model = self.github_model_mock

    def assertRaisesWithMessage(self, msg, func, *args, **kwargs):
        try:
            func(*args, **kwargs)
            self.assertFail()
        except Exception as inst:
            self.assertEqual(inst.message, msg)

    def test_get_repo_info_success(self):
        response_mock = MagicMock()
        response_mock.status_code = 200
        response_mock.json.return_value = get_repo_info
        self.github_model_mock.get_repo_info.return_value = response_mock
        result = self.github_controller.get_repo_info()

        self.assertEqual(result["owner"], "test_owner")
        self.assertEqual(result["name"], "test_repo")

    def test_get_repo_info_error_301(self):
        response_mock = MagicMock()
        response_mock.status_code = 301
        self.github_model_mock.get_repo_info.return_value = response_mock
        self.assertRaises(InvalidUsage, self.github_controller.get_repo_info)
        self.assertRaisesWithMessage(
            "Moved permanently", self.github_controller.get_repo_info
        )

    def test_get_repo_info_error_403(self):
        response_mock = MagicMock()
        response_mock.status_code = 403
        self.github_model_mock.get_repo_info.return_value = response_mock
        self.assertRaises(InvalidUsage, self.github_controller.get_repo_info)
        self.assertRaisesWithMessage("Forbidden", self.github_controller.get_repo_info)

    def test_get_repo_info_error_404(self):
        response_mock = MagicMock()
        response_mock.status_code = 404
        self.github_model_mock.get_repo_info.return_value = response_mock
        self.assertRaises(InvalidUsage, self.github_controller.get_repo_info)
        self.assertRaisesWithMessage("Not FOUND", self.github_controller.get_repo_info)

    def test_get_repo_history_empty_repo(self):
        self.assertRaises(InvalidUsage, self.github_controller.get_repo_history, None)
        self.assertRaisesWithMessage(
            "repo is required", self.github_controller.get_repo_history, None
        )

    def test_get_repo_history_empty_response(self):
        repo = "test_repo"
        response_mock = MagicMock()
        response_mock.status_code = 200
        response_mock.text.return_value = "{'message': 'Git Repository is empty.'}"
        self.github_model_mock.get_repo_history.return_value = response_mock
        result = self.github_controller.get_repo_history(repo=repo)
        self.assertEqual([], result)

    def test_get_repo_history_success(self):
        repo = "test_repo"
        response_mock = MagicMock()
        response_mock.status_code = 200
        response_mock.json.return_value = get_repo_history
        self.github_model_mock.get_repo_history.return_value = response_mock
        result = self.github_controller.get_repo_history(repo=repo)
        self.assertEqual(result[0]["commit"]["author"]["login"], "IsaacBenavides")
        self.assertEqual(
            result[0]["commit"]["author"]["name"], "Isaac Daniel Benavides Torres"
        )


if __name__ == "__main__":
    unittest.main()
