install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run --host=0.0.0.0 --port=4000
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
	docker tag studentapi:1.0.0 studentapi:1.0.0
	docker push studentapi:1.0.0