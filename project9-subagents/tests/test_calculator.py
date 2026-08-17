"""Tests for the calculator module."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from calculator import Calculator


def test_add():
    calc = Calculator()
    assert calc.add(2, 3) == 5
    assert calc.add(-1, 1) == 0
    assert calc.add(0, 0) == 0


def test_subtract():
    calc = Calculator()
    assert calc.subtract(5, 3) == 2
    assert calc.subtract(1, 1) == 0
    assert calc.subtract(0, 5) == -5


def test_multiply():
    calc = Calculator()
    assert calc.multiply(2, 3) == 6
    assert calc.multiply(-1, 3) == -3
    assert calc.multiply(0, 5) == 0


def test_divide():
    calc = Calculator()
    assert calc.divide(6, 3) == 2
    assert calc.divide(10, 2) == 5
    assert calc.divide(0, 5) == 0


def test_divide_by_zero():
    calc = Calculator()
    try:
        calc.divide(10, 0)
        assert False, "Should have raised ZeroDivisionError"
    except ZeroDivisionError:
        pass


def test_power():
    calc = Calculator()
    assert calc.power(2, 3) == 8
    assert calc.power(5, 0) == 1
    assert calc.power(0, 5) == 0


def test_history():
    calc = Calculator()
    calc.add(1, 2)
    calc.subtract(5, 3)
    assert len(calc.history) == 2
    assert "1 + 2 = 3" in calc.history
    assert "5 - 3 = 2" in calc.history


def test_clear_history():
    calc = Calculator()
    calc.add(1, 2)
    calc.clear_history()
    assert len(calc.history) == 0


if __name__ == "__main__":
    test_add()
    test_subtract()
    test_multiply()
    test_divide()
    test_divide_by_zero()
    test_power()
    test_history()
    test_clear_history()
    print("All tests passed!")
