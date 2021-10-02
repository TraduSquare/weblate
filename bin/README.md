# Scripts

- `start.sh`: start Weblate in background and show its log.
- `stop.sh`: stop Weblate without removing persisted data.
- `tail_log.sh`: show the log of Weblate.
- `prepare_update.sh`: run maintenance tasks to prepare for an update:
  - Lock all translation projects.
  - Commit pending changes in every project.
  - Push new commits to the git repositories in every project.
  - Check the status of the repositories of the projects.
  - Check the timestamp of the different backups.
- `update.sh`: pull the latest Weblate images and start it to run the migration
- `unlock_projects.sh`: unlock all the translation projects.
