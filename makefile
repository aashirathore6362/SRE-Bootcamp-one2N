HOST=0.0.0.0
APP_PORT=4000
install-dep:
	pip install -r requirements.txt
run:install-dep
	flask run --host=$(HOST) --port=$(APP_PORT)