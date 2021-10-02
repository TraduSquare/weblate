#!/bin/bash
root_dir="$(readlink -f $(dirname "$BASH_SOURCE")/..)"

set -Eeuo pipefail

cd "$root_dir/docker"
source "$root_dir/docker/project_name.sh"

echo "Locking all projects"
docker-compose -p $COMPOSE_PROJECT_NAME exec --user weblate weblate weblate lock_translation --all

echo "Git committing all projects"
docker-compose -p $COMPOSE_PROJECT_NAME exec --user weblate weblate weblate commitgit --all

echo "Git pushing all projects"
docker-compose -p $COMPOSE_PROJECT_NAME exec --user weblate weblate weblate pushgit --force-commit --all

echo "Checking status of projects"
source "$root_dir/.env/bin/activate"
python "$root_dir/bin/check_weblate_projects.py"

read -rsp $'Press any key to continue...\n' -n1 key

echo "Checking timestamp of backups"
echo "- Weblate DB dump"
docker-compose -p $COMPOSE_PROJECT_NAME exec weblate ls -l /app/data/backups/database.sql

echo "- CRON backup"
# TODO

echo "- Borg backup"
# TODO
