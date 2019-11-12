from functools import singledispatch
from math import sqrt
from random import choices, sample

from collections.abc import Iterable

# Golden ratio
_GOLDEN_RATIO = (1 + sqrt(5)) / 2


@singledispatch
def tospongebob(x):
    """A single-dispatch generic function for converting text in Python objects
    to `Mocking SpongeBob case<https://knowyourmeme.com/memes/mocking-spongebob>`_
    The core method for character vectors will return the input character vector
    with case-converted elements. For other objects, it will attempt to
    appropriately find text and convert them.

    Args:
        x: input with text to convert

    Returns:
        object of same type with text converted
    """
    return x


@tospongebob.register(str)
def tospongebob_str(x):

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
        end_ind = alpha_inds[sum(length_seq[0 : seg_ind + 1])]
        if lower:
            chars[start_ind:end_ind] = list(
                map(lambda x: x.lower(), chars[start_ind:end_ind])
            )
        else:
            chars[start_ind:end_ind] = list(
                map(lambda x: x.upper(), chars[start_ind:end_ind])
            )

        lower = not lower

    return "".join(chars)


@tospongebob.register(Iterable)
def tospongebob_Iterable(x):
    return map(tospongebob, x)


@tospongebob.register(list)
def tospongebob_list(x):
    return list(tospongebob_Iterable(x))


@tospongebob.register(tuple)
def tospongebob_tuple(x):
    return tuple(tospongebob_Iterable(x))


@tospongebob.register(set)
def tospongebob_set(x):
    return set(tospongebob_Iterable(x))


@tospongebob.register(dict)
def tospongebob_dict(x, convert_keys=False):
    keys = x.keys()
    if convert_keys:
        keys = tospongebob_Iterable(keys)
    values = tospongebob_Iterable(x.values())
    return dict(zip(keys, values))
