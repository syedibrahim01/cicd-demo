#!/usr/bin/env bash
set -e

APP_DIR="/opt/ci-cd-demo"

echo "[INFO] Creating app directory: $APP_DIR"
sudo mkdir -p "$APP_DIR"
sudo chown "$USER":"$USER" "$APP_DIR"

echo "[INFO] Copying project files..."
cp -r . "$APP_DIR"

cd "$APP_DIR"

echo "[INFO] Creating virtual environment..."
python3 -m venv venv

echo "[INFO] Activating virtual environment..."
source venv/bin/activate

echo "[INFO] Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "[INFO] Running tests..."
pytest

echo "[INFO] Starting Flask app on port 5000..."
# For demo: foreground. For real use, run via systemd or nohup.
FLASK_APP=app.py flask run --host=0.0.0.0 --port=5000
