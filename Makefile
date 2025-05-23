DOCKER_COMPOSE = ./srcs/docker-compose.yaml

all : build up

up :
	docker compose -f $(DOCKER_COMPOSE) up

down :
	docker compose -f $(DOCKER_COMPOSE) down

start :
	docker compose -f $(DOCKER_COMPOSE) start

stop :
	docker compose -f $(DOCKER_COMPOSE) stop

build :
	docker compose -f $(DOCKER_COMPOSE) build

remove :
	docker system prune --all

re : remove build up

status :
	docker ps
