from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route("/calculate", methods=["GET"])
def calculate():
    num1 = float(request.args.get("num1"))
    num2 = float(request.args.get("num2"))
    operation = request.args.get("operation")

    if operation == "add":
        result = num1 + num2
    elif operation == "subtract":
        result = num1 - num2
    elif operation == "multiply":
        result = num1 * num2
    elif operation == "divide":
        result = num1 / num2
    else:
        return jsonify({"error": "Invalid operation"})

    return jsonify({"result": result})


if __name__ == "__main__":
    app.run(host="localhost", port=8080)
