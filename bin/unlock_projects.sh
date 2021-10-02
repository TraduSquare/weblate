#!/bin/bash
root_dir="$(readlink -f $(dirname "$BASH_SOURCE")/..)"

set -Eeuo pipefail

cd "$root_dir/docker"
source "$root_dir/docker/project_name.sh"

echo "Unlocking all projects"
docker-compose -p $COMPOSE_PROJECT_NAME exec --user weblate weblate weblate unlock_translation --all
