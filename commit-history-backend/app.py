from flask import Flask, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
from flask_json_schema import JsonValidationError
from exceptions import InvalidUsage
from views.github import github_views

load_dotenv()

app = Flask(__name__)

cors = CORS(app, resources={r"/*": {"origins": "*"}})

# VIEWS
app.register_blueprint(github_views)


# ERRORS HANDLER
@app.errorhandler(JsonValidationError)
def validation_error(e):
    return jsonify(
        {
            "error": e.message,
            "errors": [validation_error.message for validation_error in e.errors],
        }
    )


@app.errorhandler(InvalidUsage)
def handle_invalid_usage(error):
    response = jsonify(error.to_dict())
    response.status_code = error.status_code
    return response


if __name__ == "__main__":
    app.run(debug=True, port=5001, host="0.0.0.0")
