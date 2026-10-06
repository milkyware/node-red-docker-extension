# AGENTS.md

Docker Desktop Extension for Node-RED (publisher: MilkyWare). This repo ships no
application source: it only packages extension metadata, a static HTML UI, and a
compose file that runs the upstream `nodered/node-red` image.

## What this is
- `Dockerfile` is `FROM scratch`; it copies only `ui/`, `docker-compose.yml`,
  `metadata.json`, `icon.svg`. Nothing executes inside the extension image.
- `metadata.json` wires the UI (`ui/index.html`, root `/ui`) and the VM compose file.
- `ui/index.html` is a single iframe pointing at `http://localhost:41880`.
- `docker-compose.yml` maps host `41880` → container `1880`, persists `/data` in
  the `nodered_data` volume, and pulls `nodered/node-red:latest`.
- There is no `package.json`, tests, or linter. Verification is Docker-only.

## Commands (Windows / pwsh — see `.vscode/tasks.json`)
Build + validate ("Docker Extension Validate"):
```powershell
docker buildx build . -t milkyware/node-red-docker-extension:0.0.1 --build-arg CHANGELOG=dummy --platform="linux/amd64,linux/arm64" --load
docker extension validate milkyware/node-red-docker-extension:0.0.1
```
Install locally for manual testing ("Docker Extension Debug"):
```powershell
docker extension rm milkyware/node-red-docker-extension
docker buildx build . -t milkyware/node-red-docker-extension --build-arg CHANGELOG=dummy --platform="linux/amd64,linux/arm64" --load
docker extension install milkyware/node-red-docker-extension --force
docker extension dev debug milkyware/node-red-docker-extension
```

## Gotchas
- The host port `41880` is hardcoded in two places. Changing it requires editing
  both `docker-compose.yml` and the iframe `src` in `ui/index.html`.
- `CHANGELOG` and `DESCRIPTION` are declared as build `ARG`s. Release CI injects
  the release notes and README; local builds pass `CHANGELOG=dummy`.
- `.github/workflows/extension-ci.yml` only runs `docker build` (no tests).
  `extension-release.yml` triggers on a published GitHub release and pushes
  multi-arch images to both Docker Hub and GHCR.
- The `com.docker.extension.icon` and screenshot labels reference raw GitHub URLs
  pinned to a specific commit / branch; update them when those assets move.
- `.gitignore` is the stock Visual Studio template and gives a misleading
  ".NET repo" impression — there is no .NET code here.
