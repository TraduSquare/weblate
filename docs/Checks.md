# Add new translation check

1. Create a new Python script in `customization/<project>/checks/`
2. Make sure to define a different `check_id` and implement the methods
   `check_highlight` and `check_single` inside a new class that inherits
   `TargetCheck`
3. Modify `/docker/docker-compose.override.yml` to include the full qualified
   name of the new class in `WEBLATE_ADD_CHECK` (e.g.:
   `myproject.checks.mycheck.MyCheckClass`)
4. Restart Weblate
5. Make sure the segments in the target PO files contain the flag of the new
   `check_id` (and pull in Weblate). Otherwise you can add the flag manually per
   segment or component from the Weblate UI.
6. Run the script `/bin/reload_checks.sh <weblate-project>` to re-run the checks
   of the project.
