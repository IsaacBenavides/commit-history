import os
import requests


class BaseRepository:

    def __init__(self, *args, **kwargs):
        super(BaseRepository, self).__init__(*args, **kwargs)

    def get(self, path):
        url = os.getenv("GITHUB_API_URL")
        key = os.getenv("GITHUB_KEY")
        return requests.get(f"{url}{path}", headers={"Authorization": f"Bearer {key}"})
