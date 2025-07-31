up:
	docker compose -f srcs/docker-compose.yml --env-file srcs/env up --build -d

down:
	docker compose -f srcs/docker-compose.yml --env-file srcs/env down
	

re: down up

