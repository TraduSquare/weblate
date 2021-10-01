# Setup a new instance of Weblate

1. Install Docker and Docker Compose
2. Copy `/docker/docker-compose.override-template.yml` to
   `/docker/docker-compose.override.yml`
3. Modify `/docker/project_name.sh` to set your group name.
4. Modify the template file with your settings.
5. Create the customization files in the `/customize` folder.
6. Run the site with `/bin/start.sh`
   1. Note the containers will run in background and the terminal will show
      their logs. If you do Control-C the containers will continue to run.

For more information check the Weblate documentation:

- [Deploy](https://docs.weblate.org/en/latest/admin/install/docker.html)
- [Customize](https://docs.weblate.org/en/latest/admin/customize.html)
- [Customize with Docker](https://docs.weblate.org/en/latest/admin/install/docker.html#further-configuration-customization)
