DOCKER_COMPOSE = ./srcs/docker-compose.yaml

all : create up

create:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb

up :
	@docker compose -f $(DOCKER_COMPOSE) up -d --no-deps --build --remove-orphans --wait

down :
	@docker compose -f $(DOCKER_COMPOSE) down

start :
	@docker compose -f $(DOCKER_COMPOSE) start

stop :
	@docker compose -f $(DOCKER_COMPOSE) stop

remove :
	@docker system prune --all -f
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

re : down remove all

status :
	@docker ps

logs:
	@echo "\n[ LOGS: mariadb ]\n"
	@docker logs mariadb
	@echo "\n[ LOGS: wordpress ]\n"
	@docker logs wordpress
	@echo "\n[ LOGS: nginx ]\n"
	@docker logs nginx
