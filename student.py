from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin

app = Flask(__name__)

tasks = [
    {
        'id': 1,
        'title': 'CS'
    },
    {
        'id': 2,
        'title': 'EC'
    }
]

@app.route('/api/v1/student', methods=['POST'])
def check_std():
    task = {
       'id': tasks[-1]['id'] + 1,
        'title': request.json['title']
    }
    tasks.append(task)
    return jsonify(task)

@app.route('/api/v1/student', methods=['GET'])
def get_tasks():
    return jsonify(tasks)

@app.route('/api/v1/student/<int:task_id>', methods=['PUT'])
def update_task(task_id):
    task = [task for task in tasks if task['id'] == task_id]
    task[0]['title'] = request.json.get('title', task[0]['title'])
    return jsonify(task[0])

@app.route('/api/v1/student/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    task = [task for task in tasks if task['id'] == task_id]
    tasks.remove(task[0])
    return jsonify({'result': True})

@app.route('/api/v1/student/<int:task_id>', methods=['GET'])
@cross_origin(origin='*')
def getid_tasks(task_id):
     task = [task for task in tasks if task['id'] == task_id]
     return jsonify(task[0])