# Because Docker hates the community.
# This is just one more bug in Docker unresolved due to stupid strong opinions.
# Workaround for https://github.com/docker/compose/issues/745

# We bash-source this file from the scripts in /bin to get this env var
export COMPOSE_PROJECT_NAME="tradusquare-weblate"
