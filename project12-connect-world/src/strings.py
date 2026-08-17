"""String utility functions with intentional bugs."""


def reverse_string(s):
    """Reverse a string."""
    return s[::-1]


def is_palindrome(s):
    """Check if a string is a palindrome."""
    s = s.lower().replace(" ", "")
    return s == s[::-1]


def count_vowels(s):
    """Count the number of vowels in a string.
    
    BUG: Counts 'y' as a vowel (it's not).
    """
    vowels = "aeiouAEIOU"
    count = 0
    for char in s:
        if char in vowels:
            count += 1
    return count


def capitalize_words(s):
    """Capitalize the first letter of each word."""
    return s.title()


def remove_duplicates(s):
    """Remove duplicate characters from a string."""
    result = ""
    for char in s:
        if char not in result:
            result += char
    return result


def longest_word(s):
    """Find the longest word in a sentence."""
    words = s.split()
    if not words:
        return ""
    longest = words[0]
    for word in words:
        if len(word) > len(longest):
            longest = word
    return longest


def word_count(s):
    """Count the number of words in a sentence."""
    if not s or not s.strip():
        return 0
    return len(s.split())


def to_snake_case(s):
    """Convert a string to snake_case."""
    result = ""
    for i, char in enumerate(s):
        if char in " -":
            if result and result[-1] != "_":
                result += "_"
        elif char.isupper():
            if i > 0 and result and result[-1] not in "_ -":
                result += "_"
            result += char.lower()
        else:
            result += char
    return result
