#!/usr/bin/env bash

# Use the Phar rather than require it because we don't deploy the docs on every build.
curl -O http://get.sensiolabs.org/sami.phar

# Because Travis only clones a single branch, we only want to build everything on master.
if [ "$TRAVIS_BRANCH" == "master" ]; then
    php sami.phar update build/sami-config.php -v
else
    php sami.phar update build/sami-config.php -vvv --only-version="$TRAVIS_BRANCH"
fi
