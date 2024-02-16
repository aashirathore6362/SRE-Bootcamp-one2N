install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run --host=0.0.0.0 --port=4000
run-app:run

#build application docker container.
flaskapp_build:
			docker build -t studentapi/flask:1.0.0 .
			