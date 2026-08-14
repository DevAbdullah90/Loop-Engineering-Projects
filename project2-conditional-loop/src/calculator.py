"""Simple calculator module with intentional bugs for Project 2."""


def add(a, b):
    """Add two numbers."""
    return a + b


def subtract(a, b):
    """Subtract b from a."""
    return a - b


def multiply(a, b):
    """Multiply two numbers."""
    return a * b


def divide(a, b):
    """Divide a by b."""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b


def modulus(a, b):
    """Return remainder of a divided by b."""
    if b == 0:
        raise ValueError("Cannot modulus by zero")
    return a % b
