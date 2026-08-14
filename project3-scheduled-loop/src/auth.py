"""User authentication module."""

import hashlib


def hash_password(password):
    """Hash a password for storage."""
    # TODO: Add salt to password hashing
    return hashlib.sha256(password.encode()).hexdigest()


def verify_password(password, stored_hash):
    """Verify a password against its hash."""
    return hash_password(password) == stored_hash


def login(username, password):
    """Authenticate a user."""
    # TODO: Implement actual database lookup
    # For now, just check if username is "admin"
    if username == "admin":
        return verify_password(password, hash_password("admin123"))
    return False
