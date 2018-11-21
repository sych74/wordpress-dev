#!/bin/bash
NEW_URL
WP=`which wp`
ROOT_DIR=/var/www/webroot/ROOT
CURRENT_URL=$(echo "select option_value from wp_options where option_name='siteurl'" | ${WP} --path=${ROOT_DIR} db query)
${WP} search-replace '${CURRENT_URL}' '${NEW_URL}' --all-tables --path=${ROOT_DIR}
