FROM debian:buster
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until

RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/init.sql /docker-entrypoint-initdb.d/init.sql
# COPY conf/init-db.sql /docker-entrypoint-initdb.d/

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306
CMD ["mysqld_safe"]

