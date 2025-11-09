#!/bin/bash
set -e

JELLYFIN_ROOT="/jellyfin"

echo "[i] cleaning up old data..."
rm -rf "$JELLYFIN_ROOT/config"
rm -rf "$JELLYFIN_ROOT/cache"

echo "[i] creating jellyfin directories..."
mkdir -p "$JELLYFIN_ROOT/config"
mkdir -p "$JELLYFIN_ROOT/cache"
mkdir -p "$JELLYFIN_ROOT/media"

echo "[i] copying docker-compose to jellyfin root..."
cp /app/docker-compose.yml "$JELLYFIN_ROOT/docker-compose.yml"

cd "$JELLYFIN_ROOT"

echo "[i] pulling images"
docker-compose pull
echo "[i] starting jellyfin docker..."
docker-compose up
