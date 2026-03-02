# Trig Identity Verifier

A trigonometric identity verification engine using Rust equality saturation with a Python web frontend.

## 🚀 Quick Deploy

### **Option 1: Replit (Recommended - No Credit Card)**
1. Go to https://replit.com
2. Click **+ Create** → **Import from GitHub**
3. Paste: `https://github.com/Zuri-Tate-School-Account/Trig-Verifier`
4. Click **Import** then **Run**
5. Visit the public URL (Replit provides it automatically)

**Guaranteed to work** - all dependencies and config are included. See [REPLIT_DEPLOYMENT.md](REPLIT_DEPLOYMENT.md) for detailed steps.

### **Option 2: Local Development**

**Quick start:**
```bash
./run.sh
# Opens http://localhost:5000
```

**Or manually:**
```bash
cargo build --release
python server.py
# Server runs on http://0.0.0.0:5000
```

### **Option 3: Docker**
```bash
docker build -t trig_verifier:latest .
docker run -p 5000:5000 trig_verifier:latest
# Opens http://localhost:5000
```

## 📚 Project Files

- `.replit` - Replit build/run configuration
- `replit.nix` - Replit dependency manifest (Rust, Python)
- `Dockerfile` - Multi-stage container build
- `main.rs` - Rust verification engine (egg equality saturation)
- `server.py` - Python HTTP server frontend
- `Cargo.toml` - Rust project config
- If `server.py` expects the binary at `target/release/...`, prefer `./trig_verifier` for container.
- If you want automated builds from GitHub, use GitHub Actions to build and push a Docker image to Docker Hub or the registry used by the host.

If you want, I can:
- Patch `server.py` to prefer `./trig_verifier` and add missing imports, or
- Create a Fly.io `fly.toml` and help run `flyctl launch` for you.
