#!/bin/bash

set -e

gitlab-runner register -r $GITLAB_CI_TOKEN -u $GITLAB_CI_URL --executor $GITLAB_CI_EXECUTOR --name $GITLAB_CI_NAME -n

gitlab-runner run

etc/init.d/xvfb start
