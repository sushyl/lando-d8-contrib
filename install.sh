#!/bin/bash

read -p "Choose Drupal core branch [8.8.x]: " branch_name
branch_name=${branch_name:-8.8.x}
echo "$branch_name selected"

read -p "Choose profile (standard/demo_umami)[standard]: " profile_name
profile_name=${profile_name:-standard}

git clone --branch $branch https://git.drupalcode.org/project/drupal.git docroot
lando start


echo "$profile_name selected"

cd docroot
composer install


lando drush site-install $profile_name --account-name=admin --account-pass=admin --db-url=mysql://database:database@database:3306/database --site-name="Drupal 8 Contrib" -y --notify
