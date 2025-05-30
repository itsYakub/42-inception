FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/joleksia.crt \
       -keyout /etc/nginx/ssl/joleksia.key \
       -subj "/C=PL/ST=Masovia/L=Warsaw/O=42 Warsaw/OU=joleksia/CN=joleksia/"

COPY ./config/default /etc/nginx/conf.d

COPY ./config/script.sh /
RUN chmod +x /script.sh

EXPOSE 443

CMD [ "/script.sh" ]
