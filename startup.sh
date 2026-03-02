#!/bin/bash
# Replit startup script for Trig Verifier

set -e  # Exit on any error

echo "🔨 Building Rust binary..."
cargo build --release
echo "✅ Rust binary built successfully"

echo "🚀 Starting Python server on port 3000..."
export PORT=3000
python server.py
