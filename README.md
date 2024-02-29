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

**API Endpoint**

GET http://localhost:5000/api/v1/student

POST http://localhost:5000/api/v1/student

PUT http://localhost:5000//api/v1/student/{id}

DELETE http://localhost:5000/api/v1/student{id}

**Run the project**
```
Make run
```
