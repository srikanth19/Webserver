from flask import Flask, jsonify
import os

app = Flask(__name__)


@app.route("/")
def root():
    return jsonify({"message": "Hello from Flask!", "env": os.getenv("APP_ENV", "dev")})


@app.route("/healthz")
def health():
    return "OK", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
