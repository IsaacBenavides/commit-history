import unittest
from unittest.mock import MagicMock
from models.github import GithubModel


class TestGithubModel(unittest.TestCase):
    def setUp(self):
        self.base_repository_mock = MagicMock()
        self.github_model = GithubModel()
        self.github_model.base_repository = self.base_repository_mock

    def test_get_repo_info_success(self):
        expected_response = {"commit_history": ["commit1", "commit2"]}
        self.base_repository_mock.get.return_value = expected_response

        result = self.github_model.get_repo_info()
        self.assertEqual(result, expected_response)

    def test_get_repo_history_success(self):
        repo_name = "example_repo"
        expected_response = {"commits": ["commit1", "commit2"]}
        self.base_repository_mock.get.return_value = expected_response

        result = self.github_model.get_repo_history(repo_name)
        self.assertEqual(result, expected_response)

    def test_get_repo_info_error_handling(self):
        self.base_repository_mock.get.side_effect = Exception(
            "Error getting repository information"
        )

        with self.assertRaises(Exception):
            self.github_model.get_repo_info()

    def test_get_repo_history_error_handling(self):
        self.base_repository_mock.get.side_effect = Exception(
            "Error getting repository commit history"
        )

        with self.assertRaises(Exception):
            self.github_model.get_repo_history("example_repo")


if __name__ == "__main__":
    unittest.main()
