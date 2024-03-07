install-dep:
	pip install -r requirements.txt
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