#!/bin/bash
NEW_URL=$1
WP=`which wp`
ROOT_DIR=/var/www/webroot/ROOT
read -r -a CURRENT_URL <<< $(echo "select option_value from wp_options where option_name='siteurl'" | ${WP} --path=${ROOT_DIR} db query)
${WP} search-replace "${CURRENT_URL[1]}" "${NEW_URL}" --all-tables --path=${ROOT_DIR}
