FROM debian:buster


# Fix broken Debian mirrors (buster is archived)
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until


#installing wordpress reqs

#RUN apt-get update && \
#    apt-get install -y php php-fpm php-mysql mariadb-client curl unzip && \
#    rm -rf /var/lib/apt/lists/*



# install everything: PHP, MariaDB client, curl, unzip, etc
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until && \
    apt-get update && \
    apt-get install -y php php-fpm php-mysql mariadb-client curl unzip && \
    rm -rf /var/lib/apt/lists/*

#RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
#    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
#    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until && \
#    apt-get update && \
#    apt-get install -y mariadb-server && \
#    rm -rf /var/lib/apt/lists/*

#installing wordpress WP-CLI


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


#copy settings to image file 

COPY tools/entrypoint.sh /entrypoint.sh

# fixing nginx not connecting to port 9000,,using a config file.
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf


#make it executable!
RUN chmod +x /entrypoint.sh

#this fixes a prob in socket binding 
RUN mkdir -p 	/run/php
#setting workdir OFC
WORKDIR /var/www/html

#
EXPOSE 9000

#
CMD ["/entrypoint.sh"]
# CMD ["php-fpm7.3", "-F"]


 




