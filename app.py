from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from CI/CD demo!"

if __name__ == "__main__":
    # For local run
    app.run(host="0.0.0.0", port=5000)
