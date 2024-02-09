install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run --host=0.0.0.0 --port=4000
run-app:run    