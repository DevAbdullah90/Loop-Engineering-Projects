"""Tests for the calculator module."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from calculator import add, subtract, multiply, divide, modulus


def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0


def test_subtract():
    assert subtract(5, 3) == 2
    assert subtract(1, 1) == 0
    assert subtract(0, 5) == -5


def test_multiply():
    assert multiply(2, 3) == 6
    assert multiply(-1, 3) == -3
    assert multiply(0, 100) == 0


def test_divide():
    assert divide(10, 2) == 5
    assert divide(9, 3) == 3
    assert divide(1, 3) == 1/3


def test_divide_by_zero():
    try:
        divide(1, 0)
        assert False, "Should have raised ValueError"
    except ValueError:
        pass


def test_modulus():
    assert modulus(10, 3) == 1
    assert modulus(9, 3) == 0
    assert modulus(7, 2) == 1


def test_modulus_by_zero():
    try:
        modulus(1, 0)
        assert False, "Should have raised ValueError"
    except ValueError:
        pass


if __name__ == "__main__":
    test_add()
    test_subtract()
    test_multiply()
    test_divide()
    test_divide_by_zero()
    test_modulus()
    test_modulus_by_zero()
    print("All tests passed!")
