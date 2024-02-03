all: build up
re: clean all
build:
	@mkdir -p -m 777 /home/astalha/data/mariadb /home/astalha/data/wordpress
	@echo "building images ..."
	@docker-compose -f ./srcs/docker-compose.yml build
	@echo "images build DONE !!"
up:
	@echo "creating containers ..."
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@echo "stoping containers ..."
	@docker-compose -f ./srcs/docker-compose.yml down

vclean: down
	@rm -rf /home/astalha/data/mariadb/* /home/astalha/data/wordpress/*
	@echo "volumes content erased !!!"

iclean: 
	@echo "removing all images"
	@docker rmi -f $(docker images -qa)

clean:  vclean down

fclean: clean
	@rm -rf /home/astalha/data