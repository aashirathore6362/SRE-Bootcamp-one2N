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
	docker tag studentapi:1.0.0 ${DOCKER_USERNAME}/studentapi:1.0.0
	docker push ${DOCKER_USERNAME}/studentapi:1.0.0