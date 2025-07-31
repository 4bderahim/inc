#!/bin/bash
#
#
# 1. Wait for MariaDB to become reachable
echo " Waiting for MariaDB to be ready..."
# while ! mysqladmin ping -h "$MYSQL_HOST" --silent; do
#     sleep 1
# done
echo "done waiting .."


set -e

if [ ! -f wp-config.php ] && [ ! -d wp-includes ] ; then
    wp core download --allow-root
    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=https://$DOMAIN_NAME \
        --title="MySite" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASS \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email \
        --allow-root

    wp user create $WP_USER $WP_USER_EMAIL \
        --user_pass=$WP_USER_PASS \
        --role=author \
        --allow-root
else
	echo "wordpress already installed !!"

fi

php-fpm7.3 -F


