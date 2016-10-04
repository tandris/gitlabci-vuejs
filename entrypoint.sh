#!/bin/bash

set -e

#Maven Sonar config 
#cd /home/gitlab-runner/.m2/
#sed -i 's/SONAR_HOST_URL/'$SONAR_HOST_URL'/' settings.xml
#sed -i 's/SONAR_JDBC_URL/'$SONAR_JDBC_URL'/' settings.xml
#sed -i 's/SONAR_JDBC_USER/'$SONAR_JDBC_USER'/' settings.xml
#sed -i 's/SONAR_JDBC_PWD/'$SONAR_JDBC_PWD'/' settings.xml

#XVFB config
export DISPLAY=:99
#xvfb-run --server-args="-screen 0, 1366x768x24" selenium-standalone start

gitlab-runner register -r $GITLAB_CI_TOKEN -u $GITLAB_CI_URL --executor $GITLAB_CI_EXECUTOR --name $GITLAB_CI_NAME -n

gitlab-runner run
