install-dep:
	pip install -r requirements.txt

run:install-dep

	flask -A student.py run --host=${HOSTPORT} --port=${APP_PORT}
run-app:run

#build application docker container.
flaskapp_build:
			docker build -t studentapi:1.0.0 .

#Build and run the application using docker compose.
docker_build:
	docker compose up -d flask_db
	docker compose build

#Push the docker image
docker_push:
	docker tag studentapi:1.0.0 ${REPO_NAME}/studentapi:1.0.0
	docker push ${REPO_NAME}/studentapi:1.0.0

app-run:install-dep
	flask run
docker-build:
	docker build -t studentapi:$(IMAGE_TAG) .
docker-run: 
	docker run -it -e FLASK_RUN_HOST=$(HOST) -e FLASK_RUN_PORT=$(PORT) -p $(PORT):$(PORT) studentapi:$(IMAGE_TAG)

start-db:
	docker compose up -d flask_db
db-migrate:
	docker compose up db_migrate
compose-flask-app:
	docker compose up flask_app

