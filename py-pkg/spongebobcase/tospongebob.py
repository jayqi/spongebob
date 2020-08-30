from collections import defaultdict
from copy import copy
from functools import singledispatch
from math import sqrt
from random import choices, sample

import collections.abc
from typing import Dict, Iterable, TypeVar
from types import GeneratorType


# Golden ratio
_GOLDEN_RATIO = (1 + sqrt(5)) / 2


T = TypeVar("T")


@singledispatch
def tospongebob(x: T) -> T:
    """A single-dispatch generic function for converting text in Python objects
    to [Mocking SpongeBob case](https://knowyourmeme.com/memes/mocking-spongebob).
    The core method for strings will return the input string with converted to Mocking Spongebob
    case. For other objects, it will attempt to appropriately find contained strings and convert
    them. Note that this returns new objects and should not be modifying any objects inplace.

    Args:
        x: input with text to convert

    Returns:
        new object of same type with text converted
    """
    if hasattr(x, "__dict__"):
        x_dict = tospongebob(x.__dict__)
        x = copy(x)
        x.__dict__ = x_dict
    return x


@tospongebob.register(str)
def tospongebob_str(x: str) -> str:

    chars = [char for char in x]

    alpha_inds = [ind for ind, char in enumerate(chars) if char.isalpha()]

    # Generate a random sequence of 1-, 2-, or 3-length subsequences
    # that sum up to the number of alphabetic characters
    # We will alternate casing of these

    length_seq = []
    while sum(length_seq) < len(alpha_inds):
        next_val = choices(
            population=(1, 2, 3),
            weights=(0.5, 0.5 / _GOLDEN_RATIO, 0.5 / _GOLDEN_RATIO ** 2),
        )[0]
        if sum(length_seq) + next_val <= len(alpha_inds):
            length_seq.append(next_val)

    # Iterating through the generated subsquences
    lower = sample((True, False), 1)[0]
    alpha_inds.append(alpha_inds[-1] + 1)  # Need this to get final interval end
    for seg_ind in range(len(length_seq)):
        start_ind = alpha_inds[sum(length_seq[0:seg_ind])]
        end_ind = alpha_inds[sum(length_seq[0 : seg_ind + 1])]  # noqa: E203
        if lower:
            chars[start_ind:end_ind] = [char.lower() for char in chars[start_ind:end_ind]]
        else:
            chars[start_ind:end_ind] = [char.upper() for char in chars[start_ind:end_ind]]

        lower = not lower

    return "".join(chars)


@tospongebob.register(dict)
def tospongebob_dict(x: Dict, convert_names: bool = False, convert_by_group: bool = False) -> Dict:
    dict_type = type(x)
    keys = x.keys()
    if convert_names:
        keys = tospongebob(k for k in keys)
    values = tospongebob((v for v in x.values()), convert_by_group=convert_by_group)

    # Special case for defauldict: different constructor
    if isinstance(x, defaultdict):
        return dict_type(x.default_factory, zip(keys, values))

    return dict_type(zip(keys, values))


@tospongebob.register(GeneratorType)
def tospongebob_generator(x: Iterable, convert_by_group: bool = False) -> Iterable:
    if convert_by_group:
        # Need to save generator contents so we can use it multiple times
        x = list(x)
    gen = (tospongebob(item) for item in x)
    if convert_by_group:
        lookup = dict(zip(x, gen))
        gen = (lookup[item] for item in x)
    return gen


@tospongebob.register(collections.abc.Iterable)
def tospongebob_iterable(x: Iterable, convert_by_group: bool = False) -> Iterable:
    gen = (tospongebob(item) for item in x)
    if convert_by_group:
        lookup = dict(zip(x, gen))
        gen = (lookup[item] for item in x)
    if is_namedtuple_instance(x):
        # Need special handling for namedtuples because they are instantiated by args or kwargs
        return type(x)(*gen)
    return type(x)(gen)


def is_namedtuple_instance(x) -> bool:
    # https://stackoverflow.com/a/2166841/5957621
    t = type(x)
    b = t.__bases__
    if len(b) != 1 or b[0] != tuple:
        return False
    f = getattr(t, "_fields", None)
    if not isinstance(f, tuple):
        return False
    return all(type(n) == str for n in f)
