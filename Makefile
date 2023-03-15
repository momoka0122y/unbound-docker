restart:
	docker-compose down
	docker-compose up -d
logs:
	docker-compose logs -f
bash:
	docker exec -it unbound bash
build:
	docker-compose build
