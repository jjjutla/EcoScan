from flask import Flask, request, jsonify, send_from_directory, render_template
import os
import requests

app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    if file:
        filename = 'img.png'  
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        return jsonify({"message": "File uploaded successfully", "filename": filename}), 200

@app.route('/img.png')
def serve_image():
    return send_from_directory(app.config['UPLOAD_FOLDER'], 'img.png', mimetype='image/png')

@app.route('/task', methods=['GET'])
def task():
    image_url = request.host_url.rstrip('/') + '/img.png'  
    headers = {
        "Authorization": "///",
        "Content-Type": "application/json"
    }
    data = {
        "image_url": image_url,
        "enable_pbr": True
    }
    response = requests.post('//', headers=headers, json=data)
    taskID = response.json().get('result')
    return jsonify({'taskID': taskID})

@app.route('/status/<taskID>', methods=['GET'])
def status(taskID):
    headers = {
        "Authorization": "//" 
    }
    response = requests.get(f'////{taskID}', headers=headers)
    response_data = response.json()
    progress = response_data.get('progress', 'Not available')
    status = response_data.get('status', 'Not available')
    return jsonify({'progress': progress, 'status': status})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80) 
