import pytest
from spongebob.tospongebob import tospongebob

testcases = [
    "spongebob squarepants",
    ["who lives in a pineapple", "under the sea", "spongebob squarepants!"],
    ("Absorbent and yellow", "and porous is he", "spongebob squarepants!"),
]


@pytest.mark.parametrize("x", testcases)
def test_tospongebob_end_to_end(x):
    tospongebob(x)
