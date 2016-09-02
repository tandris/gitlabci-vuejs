#!/bin/bash

set -e

export DISPLAY=:99
#xvfb-run --server-args="-screen 0, 1366x768x24" selenium-standalone start

gitlab-runner register -r $GITLAB_CI_TOKEN -u $GITLAB_CI_URL --executor $GITLAB_CI_EXECUTOR --name $GITLAB_CI_NAME -n

gitlab-runner run
