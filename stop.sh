#!/bin/bash
DOCKER_DIR="/docker"

cd "$DOCKER_DIR" || { echo "Nie można przejść do katalogu $DOCKER_DIR"; exit 1; }

for dir in */ ; do
  if [ -f "$dir/docker-compose.yaml" ] || [ -f "$dir/docker-compose.yml" ]; then
    echo "Zatrzymywanie docker-compose w $dir"
    (cd "$dir" && docker compose down)
  fi
done
