#!/usr/bin/env bash
# Serve the Field Checklist on http://localhost:8000 (Mac / Linux).
# Usage: ./start.sh            (default port 8000)
#        ./start.sh 3000       (pick another port)
cd "$(dirname "$0")"
PORT="${1:-8000}"

echo "Field Checklist running at: http://localhost:$PORT"
echo "Press Ctrl+C to stop."

if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server "$PORT"
elif command -v python >/dev/null 2>&1; then
  python -m http.server "$PORT"
elif command -v npx >/dev/null 2>&1; then
  npx --yes serve -l "$PORT" .
else
  echo "Neither Python nor Node.js was found. Install Python from https://www.python.org/downloads/"
  exit 1
fi
