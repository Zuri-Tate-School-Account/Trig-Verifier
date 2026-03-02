#!/bin/bash
# Quick local build & run script

set -e

echo "🔨 Building Trig Verifier..."
cargo build --release

echo ""
echo "✅ Build complete!"
echo "🚀 Starting server on http://0.0.0.0:5000"
echo "   (Local access: http://localhost:5000)"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Export PORT in case server.py wants to read it
export PORT=5000

python server.py
