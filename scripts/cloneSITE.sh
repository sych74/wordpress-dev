#!/bin/bash

GIT_URL=$1
GIT_USER=$2
GIT_TOKEN=$3
GIT_BRANCH=$4

ROOT_DIR=/var/www/webroot/ROOT;
rm -rf ${ROOT_DIR}

host=$(echo "${GIT_URL}" |sed "s/:\/\//&${GIT_USER}:${GIT_TOKEN}@/")
git clone -b "${GIT_BRANCH}" --single-branch ${HOST} ${ROOT_DIR}
chown nginx:nginx -hR ${ROOT_DIR}
