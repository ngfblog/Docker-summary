from flask import Flask, send_from_directory
import subprocess

app = Flask(__name__)

@app.route('/generate')
def generate_summary():
    subprocess.call(["/bin/bash", "/app/generate_summary.sh"])
    return "Summary generated."

@app.route('/view')
def view_summary():
    return send_from_directory('/app', 'docker_summary.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8090)