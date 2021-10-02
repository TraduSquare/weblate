#!/bin/bash
root_dir="$(readlink -f $(dirname "$BASH_SOURCE")/..)"

set -Eeuo pipefail

source "$root_dir/docker/project_name.sh"

backup_dir=$root_dir/backups
now=$(date -u '+%d.%m.%Y-%H.%M.%S')

output=$backup_dir/$now
echo "Creating backup in $output"
mkdir -p $output

backup_volume()
{
  volume=$1
  target=$2

  echo "Backing up $volume"
  docker run -it --rm --security-opt label=disable -v ${COMPOSE_PROJECT_NAME}_${volume}:${target} -v ${output}/:/backup alpine tar czf /backup/${volume}.tar.gz ${target}
}

backup_volume weblate-data /app/data
backup_volume postgres-data /var/lib/postgresql/data
backup_volume redis-data /data
backup_volume ssl-certs /var/lib/https-portal

echo "Display timestamp of some DB files"
tar -t -v --full-time -f $output/postgres-data.tar.gz | grep "pg_stat"
