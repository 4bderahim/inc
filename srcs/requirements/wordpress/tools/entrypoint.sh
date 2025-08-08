#!/bin/bash

set -e

echo "Waiting for MariaDB to be ready..."
echo "⏳ Waiting for MariaDB to become available..."
until mysqladmin ping -h mariadb --silent; do
    sleep 1
done
echo "✅ MariaDB is up."
echo "MariaDB is up."

if [ ! -f wp-config.php ]; then
    wp core download --allow-root
    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$MYSQL_HOST \
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
fi

php-fpm7.3 -F
