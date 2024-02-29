install-dep:
	pip install -r requirements.txt
run:install-dep
	flask -A student.py run