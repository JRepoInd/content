#!/usr/bin/env bash

echo "starting to install packs ..."

SECRET_CONF_PATH=$(cat secret_conf_path)

echo "starting configure_and_install_packs ..."

# $1 = INSTANCE_ROLE
# $2 = gitlab or ''

if [ "$2" = "gitlab" ]; then
  python3 ./Tests/Marketplace/configure_and_install_packs.py -s "$SECRET_CONF_PATH" --ami_env "$1" --branch "$CI_COMMIT_BRANCH" --build_number "$CI_PIPELINE_ID" -af "$ARTIFACTS_FOLDER"
else
  python3 ./Tests/Marketplace/configure_and_install_packs.py -s "$SECRET_CONF_PATH" --ami_env "$1" --branch "$CIRCLE_BRANCH" --build_number "$CI_PIPELINE_ID"
fi

exit $RETVAL
