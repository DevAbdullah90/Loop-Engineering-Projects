"""Shopping cart module with an intentional bug."""


class ShoppingCart:
    def __init__(self):
        self.items = []
    
    def add_item(self, name, price, quantity=1):
        """Add an item to the cart."""
        self.items.append({
            "name": name,
            "price": price,
            "quantity": quantity
        })
    
    def remove_item(self, name):
        """Remove an item from the cart by name."""
        for i, item in enumerate(self.items):
            if item["name"] == name:
                del self.items[i]
                return True
        return False
    
    def get_total(self):
        """Calculate the total price of all items."""
        total = 0
        for item in self.items:
            total += item["price"] * item["quantity"]
        return total
    
    def get_item_count(self):
        """Get the total number of items in the cart."""
        return len(self.items)
    
    def apply_discount(self, percent):
        """Apply a percentage discount to all items.
        
        BUG: This function has an off-by-one error.
        A 10% discount should multiply by 0.9, but it multiplies by 0.1.
        """
        discount_multiplier = 1 - percent / 100
        for item in self.items:
            item["price"] = item["price"] * discount_multiplier
    
    def clear(self):
        """Remove all items from the cart."""
        self.items = []
    
    def __repr__(self):
        return f"ShoppingCart(items={len(self.items)})"
