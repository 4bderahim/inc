FROM debian:buster
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until

RUN apt-get update && apt-get install -y php php-fpm php-mysql mariadb-client curl unzip && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY tools/entrypoint.sh /entrypoint.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /entrypoint.sh
RUN mkdir -p /run/php

WORKDIR /var/www/html
EXPOSE 9000
CMD ["/entrypoint.sh"]
