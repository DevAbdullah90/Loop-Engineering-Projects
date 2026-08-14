"""Utility functions for data processing."""


def parse_csv(file_path):
    """Parse a CSV file and return a list of dictionaries."""
    # TODO: Handle malformed CSV
    # TODO: Add support for different encodings
    results = []
    with open(file_path, 'r') as f:
        headers = f.readline().strip().split(',')
        for line in f:
            values = line.strip().split(',')
            results.append(dict(zip(headers, values)))
    return results


def format_currency(amount, currency="USD"):
    """Format a number as currency."""
    # TODO: Add support for more currencies
    symbols = {"USD": "$", "EUR": "€", "GBP": "£"}
    symbol = symbols.get(currency, currency)
    return f"{symbol}{amount:,.2f}"


def calculate_percentage(part, total):
    """Calculate percentage."""
    if total == 0:
        return 0.0
    return (part / total) * 100


def truncate_string(text, max_length=100):
    """Truncate a string to max_length, adding ellipsis if needed."""
    if len(text) <= max_length:
        return text
    return text[:max_length-3] + "..."
