# container's operating system
FROM debian:bullseye

# containers packages
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req \
 -x509 \
 -nodes \
 -days 365 \
 -newkey rsa:4096 \
 -keyout /etc/nginx/ssl/private.key \
 -out /etc/nginx/ssl/cert.crt \
 -subj "/C=PL/ST=Masovia/L=Warsaw/O=42Warsaw/OU=student/CN=joleksia.42.fr/UID=joleksia"
COPY ./config/default /etc/nginx/sites-available/default

# port expose
EXPOSE 443

# server starting
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
