install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run --host=${HOSTPORT} --port=${APP_PORT}
run-app:run    