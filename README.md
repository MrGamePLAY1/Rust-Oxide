This repository builds a Docker image that installs SteamCMD, downloads the Rust dedicated server (Steam AppID 258550), and installs uMod (Oxide). The container exposes Rust ports 28015/28016 and launches the server via the entry script. A GitHub Actions workflow builds and publishes the image to GHCR on pushes to main that modify the Docker or entry scripts.

See:
- Dockerfile: [docker_compose](docker_compose) (`ENTRYPOINT` defined here)
- Entrypoint: [entry.sh](entry.sh) (starts `RustDedicated`)
- CI workflow: [.github/workflows/docker-publish.yml](.github/workflows/docker-publish.yml)
