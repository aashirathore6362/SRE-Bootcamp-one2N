install-dep:
	pip install -r requirements.txt

run:install-dep
	flask -A student.py run --host=${HOSTPORT} --port=${APP_PORT} --debug

run-app:run

#Push the docker image
docker_push:
	docker tag studentapi:$(IMAGE_TAG) ${USERNAME}/studentapi:$(IMAGE_TAG)
	docker push ${USERNAME}/studentapi:$(IMAGE_TAG)

docker-build:
	docker build -t studentapi:$(IMAGE_TAG) .
docker-run: 
	docker run -it -e FLASK_RUN_HOST=$(HOST) -e FLASK_RUN_PORT=$(PORT) -p $(PORT):$(PORT) studentapi:$(IMAGE_TAG)

start-db:
	docker compose up -d flask_db
db-migrate:
	docker compose up db_migrate
compose-flask-app:
	docker compose up flask_ap