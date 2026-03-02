# Deploy Trig Verifier to the Web (iPad Steps)

The Docker image is **already built & tested**. Here are your options:

---

## Option 1: Replit (Easiest – No Credit Card Needed) ⭐

### What You Need
- A Replit account (free)
- Your GitHub repo link
- 3 minutes

### Steps

1. **Go to Replit**
   - Open https://replit.com in Safari
   - Sign up with GitHub (one click)

2. **Import repo**
   - Click **+ Create** → **Import from GitHub**
   - Paste your repo URL
   - Click **Import**

3. **Run the container**
   - Replit auto-detects the Dockerfile
   - Click **Run** button (green play icon)
   - Wait ~2 min for the build & start

4. **Access your app**
   - Click the **Web preview** button (top right)
   - Your verifier opens in a new tab! 🎉
   - Replit also gives you a shareable public URL

---

## Option 2: Fly.io (Free but Needs Payment Method on File)

### What You Need
- A credit card (won't be charged, but required on file)
- A GitHub account
- 5 minutes

### Steps

1. **Go to Fly.io and sign up**
   - Open https://fly.io in Safari
   - Click **Sign Up** → use GitHub to sign up (easiest)
   - Confirm your email
   - **Add a payment method** (required, won't be charged)

2. **Connect your GitHub repo**
   - In Fly.io dashboard, click **New App** → **Launch an app**
   - Select **GitHub** as source
   - Choose your repo (codespaces-blank)
   - Click **Deploy**
   - Fly.io will automatically detect the Dockerfile and build/deploy in ~5 min

3. **Access your app**
   - Once deployed (you'll see a green checkmark), click the link in the dashboard
   - Your verifier is now live! 🎉

4. **Optional: Custom domain**
   - Fly.io gives you a free `.fly.dev` domain
   - You can also add your own custom domain in app settings

---

## Option 3: Docker Hub + Heroku (Alternative)

### What You Need
- Docker Hub account (free)
- Heroku account (free tier was discontinued, but you can use Fly.io instead)

**Recommendation:** Use Option 1 (Replit). It's simpler and doesn't need a credit card.

---

## Quick Test Commands (if using Mac/Linux desktop)

If you want to test locally first:

```bash
# Build image
docker build -t trig_verifier .

# Run on localhost:8081
docker run -p 8081:8081 trig_verifier

# In another terminal, test the API
curl -X POST http://localhost:8081/api/verify \
  -H "Content-Type: application/json" \
  -d '{"lhs": "(tan x)", "rhs": "(/ (sin x) (cos x))"}'
```

---

## Environment Variables

The app uses:
- `PORT` – defaults to 8081 (both Fly.io and Replit auto-set this)
- `HOST` – defaults to 0.0.0.0 (all interfaces)

Both platforms handle this automatically. **No setup needed on your end.**

---

## API Endpoints

Once deployed, you can:

1. **Web UI**: Open `/` in browser
   - Interactive form to test identities

2. **JSON API**: POST to `/api/verify`
   ```json
   {
     "lhs": "(tan x)",
     "rhs": "(/ (sin x) (cos x))"
   }
   ```
   Response:
   ```json
   {
     "verified": true,
     "steps": ["Start : (tan x)", "Step 1: (/ (sin x) (cos x))"],
     "error": null
   }
   ```

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Build fails | Check Dockerfile syntax with `docker build .` locally |
| "Binary not found" | Ensure `Cargo.toml`, `main.rs`, `server.py` are in root |
| Port conflicts | Fly.io and Replit auto-assign ports; no manual config needed |
| Identity won't verify | Check expression syntax (use `sin`, `cos`, `tan`, `/`, `+`, `*`, `pow`, `neg`) |

---

## Examples to Try

Once your app is live, test with:
- **LHS**: `(tan x)` **RHS**: `(/ (sin x) (cos x))`
- **LHS**: `(pow (sin x) 2)` **RHS**: `(- 1 (pow (cos x) 2))`
- **LHS**: `(pow (+ (tan x) (sec x)) 2)` **RHS**: `(/ (+ 1 (sin x)) (- 1 (sin x)))`

---

## Next Steps

1. Choose Fly.io or Replit (both free)
2. Deploy in ~3–5 minutes
3. Share your live URL with classmates!

Questions? The app logs errors clearly in both platforms' dashboards.
