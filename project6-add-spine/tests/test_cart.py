"""Tests for the shopping cart module."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from cart import ShoppingCart


def test_add_item():
    cart = ShoppingCart()
    cart.add_item("Apple", 1.00, 3)
    assert len(cart.items) == 1
    assert cart.items[0]["name"] == "Apple"
    assert cart.items[0]["price"] == 1.00
    assert cart.items[0]["quantity"] == 3


def test_remove_item():
    cart = ShoppingCart()
    cart.add_item("Apple", 1.00)
    cart.add_item("Banana", 0.50)
    assert cart.remove_item("Apple") == True
    assert len(cart.items) == 1
    assert cart.items[0]["name"] == "Banana"


def test_remove_nonexistent():
    cart = ShoppingCart()
    cart.add_item("Apple", 1.00)
    assert cart.remove_item("Orange") == False
    assert len(cart.items) == 1


def test_get_total():
    cart = ShoppingCart()
    cart.add_item("Apple", 1.00, 3)
    cart.add_item("Banana", 0.50, 2)
    # Total: (1.00 * 3) + (0.50 * 2) = 3.00 + 1.00 = 4.00
    assert cart.get_total() == 4.00


def test_get_item_count():
    cart = ShoppingCart()
    assert cart.get_item_count() == 0
    cart.add_item("Apple", 1.00, 3)
    cart.add_item("Banana", 0.50, 2)
    # Item count is number of distinct items, not total quantity
    assert cart.get_item_count() == 2


def test_apply_discount():
    cart = ShoppingCart()
    cart.add_item("Apple", 100.00, 1)
    cart.add_item("Banana", 200.00, 1)
    
    # Apply 10% discount: prices should become 90 and 180
    cart.apply_discount(10)
    
    assert cart.items[0]["price"] == 90.00, f"Expected 90.00, got {cart.items[0]['price']}"
    assert cart.items[1]["price"] == 180.00, f"Expected 180.00, got {cart.items[1]['price']}"


def test_apply_discount_total():
    cart = ShoppingCart()
    cart.add_item("Expensive", 1000.00, 1)
    
    # Apply 25% discount: price should become 750
    cart.apply_discount(25)
    
    assert cart.items[0]["price"] == 750.00, f"Expected 750.00, got {cart.items[0]['price']}"
    assert cart.get_total() == 750.00


def test_clear():
    cart = ShoppingCart()
    cart.add_item("Apple", 1.00)
    cart.add_item("Banana", 0.50)
    cart.clear()
    assert len(cart.items) == 0
    assert cart.get_total() == 0


if __name__ == "__main__":
    test_add_item()
    test_remove_item()
    test_remove_nonexistent()
    test_get_total()
    test_get_item_count()
    test_apply_discount()
    test_apply_discount_total()
    test_clear()
    print("All tests passed!")
