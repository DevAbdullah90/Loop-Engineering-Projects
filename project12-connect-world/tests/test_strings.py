"""Tests for string utility functions."""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'src'))

from strings import reverse_string, is_palindrome, count_vowels


def test_reverse_string():
    assert reverse_string("hello") == "olleh"
    assert reverse_string("a") == "a"
    assert reverse_string("") == ""


def test_is_palindrome():
    assert is_palindrome("racecar") == True
    assert is_palindrome("hello") == False
    assert is_palindrome("A man a plan a canal Panama") == True


def test_count_vowels():
    assert count_vowels("hello") == 2
    assert count_vowels("xyz") == 0
    assert count_vowels("AEIOU") == 5
    assert count_vowels("rhythm") == 0  # y is not a vowel


if __name__ == "__main__":
    test_reverse_string()
    test_is_palindrome()
    test_count_vowels()
    print("All tests passed!")
