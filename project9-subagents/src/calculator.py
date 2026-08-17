"""Calculator module with THREE intentional bugs."""


class Calculator:
    def __init__(self):
        self.history = []
    
    def add(self, a, b):
        """Add two numbers."""
        result = a + b
        self.history.append(f"{a} + {b} = {result}")
        return result
    
    def subtract(self, a, b):
        """Subtract two numbers."""
        result = a - b
        self.history.append(f"{a} - {b} = {result}")
        return result
    
    def multiply(self, a, b):
        """Multiply two numbers.
        
        BUG 1: Uses addition instead of multiplication.
        """
        result = a * b
        self.history.append(f"{a} * {b} = {result}")
        return result
    
    def divide(self, a, b):
        """Divide two numbers.
        
        BUG 2: Doesn't handle division by zero.
        """
        # BUG 2: Should check if b == 0
        result = a / b
        self.history.append(f"{a} / {b} = {result}")
        return result
    
    def power(self, a, b):
        """Raise a to the power of b.
        
        BUG 3: Uses multiplication instead of power.
        """
        result = a ** b
        self.history.append(f"{a} ^ {b} = {result}")
        return result
    
    def get_history(self):
        """Get the calculation history."""
        return self.history
    
    def clear_history(self):
        """Clear the calculation history."""
        self.history = []
    
    def __repr__(self):
        return f"Calculator(history={len(self.history)} calculations)"
