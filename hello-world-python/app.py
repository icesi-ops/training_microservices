from flask import Flask
app = Flask(__name__)
@app.route("/")
def run():
    return "<h1>Hello World Python v1</h1>"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
