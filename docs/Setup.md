# Setup a new instance of Weblate

1. Install Docker, Docker Compose and Python 3
2. Copy and fill `/docker/docker-compose.override-template.yml` to
   `/docker/docker-compose.override.yml`
   - Disable any custom Weblate application (`WEBLATE_ADD_APPS`) including its
     binding volume.
3. Modify `/docker/project_name.sh` to set your group name.
4. Run the site with `/bin/start.sh`
   - Note the containers will run in background and the terminal will show their
     logs. If you do Control-C the containers will continue to run.

## Customization

1. Create the customization files in the `/customize` folder.
2. In the `docker-compose.override.yml` re-enable the volume of this folder and
   the `WEBLATE_ADD_APPS` variable.
3. Restart Weblate running `stop.sh` and then `start.sh`.

## Setup of maintenance tasks

1. Install Python 3
2. Create the Python environment for the maintenance scripts running:
   1. `python -m venv .env` from the root directory of the repository.
   2. `source .env/bin/activate`
   3. `pip install wlc`
3. Copy and fill `/bin/template.weblate` to `/bin/.weblate` with the API token
   of your Weblate profile.
4. Configure a CRON job to create a backup of the volumes daily:
   1. `sudo crontab -e` and append a line like this to run every dat at 3am:
      `0 3 * * * <repo>/bin/create_backup.sh daily`
5. Configure remote backups with [BorgBackup](https://www.borgbackup.org/)
   1. (Target machine) Install an SSH server (sshd).
   2. (Target machine) Install _BorgBackup_ with your distro package manager
   3. (Target machine) Create a new user user
   4. (Target machine) Add the public key of Weblate to the authorized hosts and
      make sure the file has permissions 600.
   5. Specify the target machine in the Weblate backup UI as
      `ssh://user@host:port/path`

This setup will perform the automatic backups at:

- Database dump: 1:30 am
- Borg incremental backup: 2:00 am
- CRON job to backup container volumes: 3:00 am

## References

For more information check the Weblate documentation:

- [Deploy](https://docs.weblate.org/en/latest/admin/install/docker.html)
- [Customize](https://docs.weblate.org/en/latest/admin/customize.html)
- [Customize with Docker](https://docs.weblate.org/en/latest/admin/install/docker.html#further-configuration-customization)
