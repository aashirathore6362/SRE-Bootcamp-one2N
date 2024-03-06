Building REST APIs using Flask

This is a simple student CRUD API implemented in Python Flask that can perform CRUD (create, get, update, delete) operations on a resource.


**Install guide**

Clone the repo.
```
$ git clone https://github.com/aashirathore6362/SRE-Bootcamp.git
```

Create the virtualenv.
```
$ python3 -m venv namevenv
```

**Dependencies**

Flask: Base Web Framework.

**Basic Folder Structure**

Student.py is the major application declaration file. 

makefile: Build and run the REST API locally.

requirements.txt: Installing the dependency.

runapp.sh: Running a DB migration.

docker-compose.yml: Three service are there flask_db, flask_app and db_migrate.

**API Endpoint**

GET http://localhost:5000/api/v1/student

POST http://localhost:5000/api/v1/student

PUT http://localhost:5000//api/v1/student/{id}

DELETE http://localhost:5000/api/v1/student{id}

**Run APP locally using make:**
```
make app-run

```
**Run REST API docker container:**
```
IMAGE_TAG=1.0.0 HOST=0.0.0.0 PORT=4000 make docker-run

```
**To run using docker compose:**
```
make start-db

```

```
make compose-flask-app

```

**To run DB Migrations:**
```
make db-migrate

```