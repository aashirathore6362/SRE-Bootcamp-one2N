from flask import Flask, jsonify, make_response, request
from flask_sqlalchemy import SQLAlchemy
from os import environ
from flask_migrate import Migrate
from sqlalchemy.orm import DeclarativeBase

app = Flask(__name__)

class Base(DeclarativeBase):
  pass

app.config['SQLALCHEMY_DATABASE_URI'] = environ.get("DB_URL")
db = SQLAlchemy(model_class=Base)
db.init_app(app)
migrate = Migrate(app, db, render_as_batch=False)
    
class User(db.Model):
    __tablename__ = 'student'

    id = db.Column(db.Integer, primary_key=True)
    stdname = db.Column(db.String(80), unique=True, nullable=False)
    title = db.Column(db.String(80), unique=True, nullable=False)

    def json(self):
        return {'id': self.id, 'stdname': self.stdname,'title': self.title}

with app.app_context():
    db.create_all()

#GET student
@app.route('/api/v1/student', methods=['GET'])
def get_tasks():
    try:
        allstudent = User.query.all()
        return make_response(jsonify([std.json() for std in allstudent]), 200)
    except:
        return make_response(jsonify({'message': 'error getting students'}), 500)
@app.route('/api/v1/student', methods=['POST'])
def create_student():
    try:
        data = request.get_json()
        new_std = User(stdname=data['stdname'], title=data['title'])
        db.session.add(new_std)
        db.session.commit()
        return make_response(jsonify({'message': 'student created'}), 201)
    except:
        return make_response(jsonify({'message': 'error creating student'}), 500)


@app.route('/api/v1/student/<int:id>', methods=['GET'])
def get_std(id):
    getstd = User.query.filter_by(id=id).first()
    if get_std:
        return make_response(jsonify({'getstd': getstd.json()}), 200)
    return make_response(jsonify({'message': 'student not found'}, 404))

# Update student
@app.route('/api/v1/student/<int:id>', methods=['PUT'])
def update_std(id):
    try:
        updatestd = User.query.filter_by(id=id).first()
        if updatestd:
            data = request.get_json()
            updatestd.stdname = data['stdname']
            updatestd.title = data['title']
            db.session.commit()
            return make_response(jsonify({'message': 'student updated'}), 200)
        return make_response(jsonify({'message': 'student not found'}), 404)
    except:
        return make_response(jsonify({'message': 'error updating students'}), 500)
    
# delete a student
@app.route('/api/v1/student/<int:id>', methods=['DELETE'])
def delete_std(id):
    try:
        delete_std = User.query.filter_by(id=id).first()
        if delete_std:
            db.session.delete(delete_std)
            db.session.commit()
            return make_response(jsonify({'message': 'student deleted'}), 200)
        return make_response(jsonify({'message': 'student not found'}), 404)
    except:
        return make_response(jsonify({'message': 'error deleting students'}), 500)