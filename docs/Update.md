# Update Weblate checklist

- [ ] Go to _Administration -> Tools_ and post an announcement with expiration
      date alerting potential downtime.
- [ ] Run the script `prepare_update.sh` to lock and push git repos and:
  - [ ] Verify that repositories does not have any pending change
  - [ ] Verify timestamp of daily CRON backup of container volumes
  - [ ] Verify timestamp of daily Weblate DB dump inside the volume
- [ ] Go to _Administration -> Backup_ and perform a backup with Borg
- [ ] Stop Weblate running `stop.sh`
- [ ] Create a backup with `create_backup.sh` and download to local computer
- [ ] Verify timestamp of DB files
- [ ] Update server packages via DNF
- [ ] Review release notes for required changes in configuration
- [ ] Update Weblate running `update.sh`
- [ ] Review _Performance alerts_ and DB latency
- [ ] Run `unlock_projects.sh` to unlock translation projects
- [ ] Go to _Administration -> Tools_ and post an announcement alerting the
      update is complete.
