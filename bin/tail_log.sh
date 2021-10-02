#!/bin/bash
root_dir="$(readlink -f $(dirname "$BASH_SOURCE")/..)"

set -Eeuo pipefail

cd "$root_dir/docker"
source ./project_name.sh

# Because podman-compose doesn't support yet the env vars...
# https://github.com/containers/podman-compose/pull/250
docker-compose -p $COMPOSE_PROJECT_NAME logs --tail=100 -f weblate
