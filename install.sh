#!/bin/bash

echo "Cloning 8.9.x branch"

git clone --branch 8.8.x https://git.drupalcode.org/project/drupal.git docroot
lando start

cd docroot
composer install

lando drush site-install standard --account-name=admin --account-pass=admin --db-url=mysql://database:database@database:3306/database --site-name="Drupal 8 Contrib" -y --notify
