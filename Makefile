# output coloring & timing
include .scripts/mara-app/init.mk

# virtual env creation, package updates, db migration
include .scripts/mara-app/install.mk

# if you don't want to download the two big
sync-bigquery-csv-data-sets-from-s3:
	.venv/bin/aws s3 sync s3://mara-example-project-data data --delete --no-progress --no-sign-request

#docker-build-postgres:
#	docker build -t mara-postgres:dev .scripts/docker/postgres

#docker-run-postgres:
#	docker run -i -t --rm --name mara-postgres -v $(shell pwd)/.pg_data:/var/lib/postgresql/data -p 5432:5432 --net=bridge mara-postgres:dev

#docker-build-mara:
#	docker build -t mara-app:dev .

#docker-run-mara:
#	docker run -i -t --rm --name mara-app --mount type=bind,source=$(shell pwd),target=/mara -p 5000:5000 --net=bridge mara-app:dev

docker-run-flask:
	. .venv/bin/activate; flask run --host 0.0.0.0 --with-threads --reload --eager-loading

