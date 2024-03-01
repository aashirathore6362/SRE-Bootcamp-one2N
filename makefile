install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run --host=0.0.0.0 --port=4000
run-app:run
docker-build:
	docker build -t studentapi:$(IMAGE_TAG) .
docker-run: 
	docker run -it -e FLASK_RUN_HOST=$(HOST) -e FLASK_RUN_PORT=$(PORT) -p $(PORT):$(PORT) studentapi:$(IMAGE_TAG)
run-db:
	docker compose up -d flask_db
migrate:
