build:
	docker-compose --file=production.yml build

init:
	docker-compose --file=production.yml build && docker-compose --file=production.yml up -d

db-backup:
	docker-compose --file=production.yml exec postgres backup && docker cp $(shell docker ps -aqf "name=$(shell basename $(CURDIR))_postgres_1"):/backups ./

db-backups:
	docker-compose --file=production.yml exec postgres backups

db-restore:
	docker cp ./backups/$(file) $(shell docker ps -aqf "name=$(shell basename $(CURDIR))_postgres_1"):/backups && docker-compose --file=production.yml exec postgres restore $(file)

db-backups-erase:
	rm -rf ./backups/* && docker-compose --file=production.yml exec postgres erase

createsuperuser:
	docker exec -ti $(shell basename $(CURDIR))_django_1 /bin/sh -c "python manage.py createsuperuser"

up:
	docker-compose --file=production.yml up -d

up-non-daemon:
	docker-compose --file=production.yml up

down:
	docker-compose --file=production.yml down

start:
	docker-compose --file=production.yml start

stop:
	docker-compose --file=production.yml stop

restart:
	docker-compose --file=production.yml stop && docker-compose --file=production.yml start

shell-nginx:
	docker exec -ti $(shell basename $(CURDIR))_nginx_1 /bin/sh

shell-django:
	docker exec -ti $(shell basename $(CURDIR))_django_1 /bin/sh

shell-postgres:
	docker exec -ti $(shell basename $(CURDIR))_postgres_1 /bin/sh

log-nginx:
	docker-compose --file=production.yml logs nginx

log-django:
	docker-compose --file=production.yml logs django

log-postgres:
	docker-compose --file=production.yml logs postgres

collectstatic:
	docker exec -ti $(shell basename $(CURDIR))_django_1 /bin/sh -c "python manage.py collectstatic --noinput"

prune:
	docker-compose --file=production.yml down && docker system prune -a -f && docker system prune --volumes -f

postgres-ip:
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres

local-prune:
	docker-compose --file=local.yml down && docker system prune -a -f && docker system prune --volumes -f

local-init:
	docker-compose --file=local.yml build && docker-compose --file=local.yml up -d

local-stop:
	docker-compose --file=local.yml stop

local-down:
	docker-compose --file=local.yml down

local-restart:
	docker-compose --file=local.yml stop && docker-compose --file=local.yml start

local-up:
	docker-compose --file=local.yml up -d

local-rebuild:
	docker-compose --file=local.yml up -d --build --force-recreate --no-deps
