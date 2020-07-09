from collections import deque, OrderedDict, defaultdict
from dataclasses import dataclass
import re
from types import GeneratorType
from typing import NamedTuple

from spongebobcase.tospongebob import tospongebob
import pytest

TEST_STRING = "who lives in a pineapple under the sea? spongebob squarepants!"


@pytest.mark.parametrize(
    "test_string",
    [TEST_STRING.lower(), TEST_STRING.upper(), tospongebob(TEST_STRING)],
    ids=["all_lower", "all_upper", "mixed"],
)
def test_tospongebob_str(test_string):
    """Test that tospongebob works on strings by checking that it is not all lowercase or all
    uppercase, and that casing subsequences
    """

    converted = tospongebob(test_string)
    assert not converted.islower()
    assert not converted.isupper()

    letters_only = "".join(c for c in converted if c.isalpha())
    case_subsequences = re.split("[a-z]+", letters_only)
    assert len(case_subsequences) > 1
    assert all(len(subseq) <= 3 for subseq in case_subsequences)


def test_tospongebob_object():
    """Test that tospongebob works on attributes of objects.
    """

    class QuestionAndAnswer:
        pass

    q_and_a = QuestionAndAnswer()
    q_and_a.question = "who lives in a pineapple under the sea?"
    q_and_a.answer = "spongebob squarepants!"

    converted = tospongebob(q_and_a)

    assert isinstance(converted, QuestionAndAnswer)

    assert not converted.question.islower()
    assert not converted.question.isupper()

    assert not converted.answer.islower()
    assert not converted.answer.isupper()

    assert converted != q_and_a


def test_tospongebob_namedtuple():
    """Test that tospongebob works on attributes of namedtuples.
    """

    class QuestionAndAnswer(NamedTuple):
        question: str
        answer: str

    q_and_a = QuestionAndAnswer(
        question="who lives in a pineapple under the sea?", answer="spongebob squarepants!"
    )

    converted = tospongebob(q_and_a)

    assert isinstance(converted, QuestionAndAnswer)

    assert not converted.question.islower()
    assert not converted.question.isupper()

    assert not converted.answer.islower()
    assert not converted.answer.isupper()

    assert converted != q_and_a


def test_tospongebob_dataclass():
    """Test that tospongebob works on attributes of objects.
    """

    @dataclass
    class QuestionAndAnswer:
        question: str
        answer: str

    q_and_a = QuestionAndAnswer(
        question="who lives in a pineapple under the sea?", answer="spongebob squarepants!"
    )

    converted = tospongebob(q_and_a)
    print(q_and_a)
    print(converted)

    assert isinstance(converted, QuestionAndAnswer)

    assert not converted.question.islower()
    assert not converted.question.isupper()

    assert not converted.answer.islower()
    assert not converted.answer.isupper()

    assert converted != q_and_a


@pytest.mark.parametrize("input_type", [int, float, bool])
def test_tospongebob_other_types(input_type):
    """Test that tospongebob returns non-string types as-is.
    """
    x = input_type()
    assert tospongebob(x) == x


@pytest.mark.parametrize("iterable_type", [list, tuple, set, frozenset, deque])
def test_tospongebob_iterables(iterable_type):
    """Test that tospongebob works with iterables.
    """
    test_data = ["who lives in a pineapple", "under the sea", "spongebob squarepants!"]
    iterable_instance = iterable_type(test_data)
    converted = tospongebob(iterable_instance)
    assert isinstance(converted, iterable_type)
    assert all(isinstance(x, str) for x in converted)
    assert all(not x.islower() for x in converted)
    assert all(not x.isupper() for x in converted)
    assert converted != iterable_instance


def test_tospongebob_generator():
    """Test that tospongebob works with generators.
    """
    test_data = ["who lives in a pineapple", "under the sea", "spongebob squarepants!"]
    converted = tospongebob(x for x in test_data)
    assert isinstance(converted, GeneratorType)
    converted_list = list(converted)
    assert len(converted_list) == len(test_data)
    assert all(isinstance(x, str) for x in converted_list)
    assert all(not x.islower() for x in converted_list)
    assert all(not x.isupper() for x in converted_list)


class defaultdict_subclass(defaultdict):
    pass


@pytest.mark.parametrize("dict_type", [dict, defaultdict, OrderedDict, defaultdict_subclass])
def test_tospongebob_dict(dict_type):
    test_data = {
        "question": "who lives in a pineapple under the sea?",
        "answer": "spongebob squarepants!",
    }
    dict_instance = dict_type()
    dict_instance.update(test_data)

    # Default
    converted_dict = tospongebob(dict_instance)
    assert isinstance(converted_dict, dict_type)
    assert list(converted_dict.keys()) == list(dict_instance.keys())
    assert all(not x.islower() for x in converted_dict.values())
    assert all(not x.isupper() for x in converted_dict.values())
    assert converted_dict != dict_instance

    # convert_names = True
    converted_dict = tospongebob(dict_instance, convert_names=True)
    assert isinstance(converted_dict, dict_type)
    assert all(not x.islower() for x in converted_dict.keys())
    assert all(not x.isupper() for x in converted_dict.keys())
    assert all(not x.islower() for x in converted_dict.values())
    assert all(not x.isupper() for x in converted_dict.values())
    assert converted_dict != dict_instance
