#!/bin/bash

set -e

export DISPLAY=:99
Xvfb :99 -shmem -screen 0 1366x768x16 &
x11vnc -passwd secret -display :99 -N -forever &

gitlab-runner register -r $GITLAB_CI_TOKEN -u $GITLAB_CI_URL --executor $GITLAB_CI_EXECUTOR --name $GITLAB_CI_NAME -n

gitlab-runner run



# selenium must be started by a non-root user otherwise chrome can't start
su - seleuser -c "xvfb-run --server-args=\"-screen 0, 1366x768x24\" selenium-standalone start"
