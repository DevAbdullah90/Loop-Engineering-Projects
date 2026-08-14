"""API endpoint handlers."""

from flask import Flask, jsonify, request

app = Flask(__name__)


@app.route('/api/users', methods=['GET'])
def get_users():
    """Get all users."""
    # TODO: Add pagination
    # TODO: Add authentication check
    users = [
        {"id": 1, "name": "Alice"},
        {"id": 2, "name": "Bob"}
    ]
    return jsonify(users)


@app.route('/api/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    """Get a specific user."""
    # TODO: Handle user not found
    return jsonify({"id": user_id, "name": "Unknown"})


@app.route('/api/users', methods=['POST'])
def create_user():
    """Create a new user."""
    data = request.get_json()
    # TODO: Validate input data
    # TODO: Check for duplicate username
    return jsonify({"id": 3, "name": data.get("name")}), 201


@app.route('/api/health', methods=['GET'])
def health_check():
    """Health check endpoint."""
    return jsonify({"status": "ok"})
