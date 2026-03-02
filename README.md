Quick deploy (Docker + Fly.io or Replit)

1) Build & run locally with Docker

```bash
# from repo root
docker build -t trig_verifier:latest .
docker run -p 5000:5000 --rm trig_verifier:latest
```

Open http://localhost:5000 (the Python server reads PORT from the environment, default 5000).

2) Deploy to Fly.io (free tier available)

- Install `flyctl` and log in: `flyctl auth login`
- Create an app: `flyctl launch --name my-trig-verifier --no-deploy`
- Deploy: `flyctl deploy --remote-only`

Fly.io will use the Dockerfile in the repo to build and run.

3) Deploy to Replit (use Dockerfile option or native support)

- Create a new Repl, select "Import from GitHub" or upload the repo
- If you choose the Dockerfile template, Replit will build the container automatically.  
  Otherwise create a `.replit` file with `run = "bash -lc \"cargo build --release && python server.py\""` and a `replit.nix` that installs Rust and Python (examples are in `DEPLOY_IPAD.md`).  Replit sets `PORT=5000` so the server will start on the correct port.


Notes & recommended small changes

- Ensure `server.py` imports `os`, `subprocess`, `http.server` and uses a relative exe path like `./trig_verifier`.
- If `server.py` expects the binary at `target/release/...`, prefer `./trig_verifier` for container.
- If you want automated builds from GitHub, use GitHub Actions to build and push a Docker image to Docker Hub or the registry used by the host.

If you want, I can:
- Patch `server.py` to prefer `./trig_verifier` and add missing imports, or
- Create a Fly.io `fly.toml` and help run `flyctl launch` for you.
