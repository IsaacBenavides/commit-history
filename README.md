<div align="center" style="margin-bottom:40px;">
<h3 style="font-size:60px">Commit History</h2>
<p>technical test for the position of <strong>Flutter developer</strong> at FULLTIMEFORCE</p>
</div>

## 🛠️ REQUIREMENTS

- [Flutter (>= 3.10.6)](https://flutter.dev/)
- [Docker (>= 24.0.6)](https://www.docker.com/products/docker-desktop/)
- [Docker Compose (>= v2.23.0-desktop.1)](https://www.docker.com/products/docker-desktop/)

## 🚀 Getting Started

1. [Fork](https://github.com/IsaacBenavides/commit-history) or clone this repository.

```bash
git clone git@github.com:IsaacBenavides/commit-history.git
```

## 🖥️ Start Backend

1. Go to Backend Folder

```bash
cd commit-history-backend
```

2. Build Docker

```bash
sudo docker-compose build
```

3. Start Backend

```bash
sudo docker-compose up
```

### 🔗 Endpoints

- [Get Repo Information](http://localhost:5001/api/v1/repo-info/)
- [Get Repo History](http://localhost:5001/api/v1/repo-history/?repo=commit-history)

## 📱 Start Flutter Application

1. Go to Application Folder

```bash
cd commit_history_mobile
```

2. List all available devices

```bash
flutter devices
```

something like this should appear

```
iPhone 15 Pro (mobile) • 3A477B95-7C0C-4753-9F0A-DB5891F28112
macOS (desktop)        • macos • darwin-arm64 • macOS 14.3 23D5033f darwin-arm64
Chrome (web)           • chrome • web-javascript • Google Chrome 121.0.6167.160
```

3. Start the app

```bash
flutter run -d iPhone
```

You must write the name of the device on which you want to run the application.

## 🧪 Run Test

1. Backend

```bash
sudo docker-compose run web python -m unittest discover -v
```

2. Application

```bash
flutter test
```
