DOCKER_COMPOSE = ./srcs/docker-compose.yaml
DOCKER_LOGIN=joleksia

all : up

create :
	@mkdir -p /home/$(DOCKER_LOGIN)/data/wp
	@chmod 777 /home/$(DOCKER_LOGIN)/data/wp
	@mkdir -p /home/$(DOCKER_LOGIN)/data/mdb
	@chmod 777 /home/$(DOCKER_LOGIN)/data/mdb
	@hostsed add 127.0.0.1 $(DOCKER_LOGIN).42.fr

up : create
	@docker compose -f $(DOCKER_COMPOSE) up -d --no-deps --build

down :
	@docker compose -f $(DOCKER_COMPOSE) down

clean :
	@rm -rf /home/$(DOCKER_LOGIN)/data
	@hostsed rm 127.0.0.1 $(DOCKER_LOGIN).42.fr
	@docker system prune --all -f

fclean : down clean

re : fclean all

status :
	@docker ps

logs :
	@echo "\n[ LOGS: mariadb ]\n"
	@docker logs mariadb
	@echo "\n[ LOGS: wordpress ]\n"
	@docker logs wordpress
	@echo "\n[ LOGS: nginx ]\n"
	@docker logs nginx

.PHONY : create up down clean fclean re
