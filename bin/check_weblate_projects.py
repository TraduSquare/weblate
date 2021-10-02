from wlc import Weblate
from wlc.config import WeblateConfig
from sys import exit
from os.path import abspath, join, dirname

script_dir = dirname(abspath(__file__))
token_file = join(script_dir, ".weblate")

config = WeblateConfig()
config.load(token_file)

weblate = Weblate(config=config)

status = True
for project in weblate.list_projects():
    name = project.get_data()["name"]
    print(f"- {name}")

    status = project.repository().get_data()
    needs_commit = status["needs_commit"]
    needs_merge = status["needs_merge"]
    needs_push = status["needs_push"]
    if needs_commit:
        print(f"  WARNING!! '{name}' needs to commit")
        status = False
    if needs_merge:
        print(f"  WARNING!! '{name}' needs a merge")
        status = False
    if needs_push:
        print(f"  WARNING!! '{name}' needs to push")
        status = False

if not status:
    exit(1)
