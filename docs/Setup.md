# Setup a new instance of Weblate

1. Install Docker, Docker Compose and Python 3
2. Copy and fill `/docker/docker-compose.override-template.yml` to
   `/docker/docker-compose.override.yml`
   - Disable any custom Weblate application (`WEBLATE_ADD_APPS`) including its
     binding volume.
3. Modify `/docker/project_name.sh` to set your group name.
4. Create the customization files in the `/customize` folder.
5. Run the site with `/bin/start.sh`
   - Note the containers will run in background and the terminal will show their
     logs. If you do Control-C the containers will continue to run.
6. If you have a custom Weblate app, enable now its volume and related settings
   and restart Weblate.
7. Copy and fill `/bin/template.weblate` to `/bin/.weblate` with the API token
   of your Weblate profile.
8. Create the Python environment for the maintenance scripts running:
   1. `python -m venv .env` from the root directory of the repository.
   2. `source .env/bin/activate`
   3. `pip install wlc`

For more information check the Weblate documentation:

- [Deploy](https://docs.weblate.org/en/latest/admin/install/docker.html)
- [Customize](https://docs.weblate.org/en/latest/admin/customize.html)
- [Customize with Docker](https://docs.weblate.org/en/latest/admin/install/docker.html#further-configuration-customization)
