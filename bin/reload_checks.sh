#!/bin/bash
root_dir="$(readlink -f $(dirname "$BASH_SOURCE")/..)"

set -Eeuo pipefail

if [ "$#" -ne 1 ]; then
  echo "Missing first argument with the project name"
  exit 1
fi

cd "$root_dir/docker"
source "$root_dir/docker/project_name.sh"

echo "Re-run checks for $1"
docker-compose -p $COMPOSE_PROJECT_NAME exec --user weblate weblate weblate updatechecks $1
