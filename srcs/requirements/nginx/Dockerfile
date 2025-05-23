FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

COPY ./config/script.sh /

CMD [ "/script.sh" ]
