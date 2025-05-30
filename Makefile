DOCKER_COMPOSE = ./srcs/docker-compose.yaml

all : create build up

create:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb

up :
	@docker compose -f $(DOCKER_COMPOSE) up

down :
	@docker compose -f $(DOCKER_COMPOSE) down

start :
	@docker compose -f $(DOCKER_COMPOSE) start

stop :
	@docker compose -f $(DOCKER_COMPOSE) stop

build :
	@docker compose -f $(DOCKER_COMPOSE) build

remove :
	@docker system prune --all
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

re : remove all

status :
	@docker ps
