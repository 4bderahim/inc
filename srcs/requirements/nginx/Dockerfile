FROM debian:buster

# Fix archived mirrors
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99disable-valid-until && \
    apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/ssl/private/nginx.key \
#     -out /etc/ssl/certs/nginx.crt \
#     -subj "/C=MA/ST=Khouribga/L=42/OU=Inception/CN=yourlogin.42.fr"

# sudo mkdir -p /home/abderahim/data/certs
# cd /home/abderahim/data/certs

RUN openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx.key \
  -out  /etc/ssl/certs/nginx.crt \
  -subj "/C=MA/ST=Casa/L=Casa/O=42/OU=Student/CN=localhost"


COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/conf.d/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

