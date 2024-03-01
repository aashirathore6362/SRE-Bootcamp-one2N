install-dep:
	pip install -r requirements.txt
run:install-dep
	flask run
run-app:run
docker-build:
	docker build -t studentapi:$(IMAGE_TAG) .
docker-run: 
	docker run -it -e FLASK_RUN_HOST=$(HOST) -e FLASK_RUN_PORT=$(PORT) -p $(PORT):$(PORT) studentapi:$(IMAGE_TAG)
start-db:
	docker compose up -d flask_db
migrate:
	flask db init
