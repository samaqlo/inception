all: build up
re: clean all
build:
	@mkdir -p -m 777 /home/astalha/data/mariadb /home/astalha/data/wordpress
	@echo "building images ..."
	@docker-compose -f ./srcs/docker-compose.yml build
	@echo "images build DONE !!"
up:
	@echo "creating containers ..."
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@echo "stoping containers ..."
	@docker-compose -f ./srcs/docker-compose.yml down

vclean: down iclean
	@rm -rf /home/astalha/data/*
	@echo "volumes content erased !!!"

iclean: 
	@echo "removing all images"
	docker rmi -f $(docker images -qa)

cclean: 
	@echo "removing all images"
	@docker rm -f $(docker ps -qa)

clean:  vclean down