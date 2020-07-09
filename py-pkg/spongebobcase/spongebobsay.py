from textwrap import wrap
from typing import Optional

from spongebobcase.tospongebob import tospongebob


DEFAULT_WIDTH = 40

_SPONGEBOB_ASCII = """    *
          *
     ----//-------
     \\..C/--..--/ \\   `A
      (@ )  ( @) \\  \\// |w
       \\          \\  \\---/
        HGGGGGGG    \\    /`
        V `---------`--'
            <<    <<
           ###   ###
"""

# Speech bubble tail ASCII template
# Blanks should be replaced with two-symbol character strings
_BUBBLE_TAIL_TEMPLATE = "  {}\n   {}"


def get_longest_word(what):
    words = what.split()
    return max(words, key=len)


class WidthTooSmallError(ValueError):
    pass


def _ascii_func_factory(left, right, top, bottom, tail):
    def ascii_func(what: str, print_: bool = True, width: Optional[int] = None):

        # Get string representation of spongebob-cased object
        what = str(tospongebob(what))

        # Get longest word
        longest_word = get_longest_word(what)

        if width is not None:
            # If width is specified, validate that it's long enough
            if width < len(longest_word):
                msg = (
                    f"Specified width {width} is less than length of "
                    f"longest word {longest_word} ({len(longest_word)})."
                )
                raise WidthTooSmallError(msg)
        else:
            # Otherwise, set to max between longest word and default
            width = max((DEFAULT_WIDTH, len(longest_word)))

        # Split text up into lines by width
        txt = wrap(what, width=width)
        max_length = max(map(len, txt))

        # Add the speech bubble left-right boundaries
        txt = [" ".join([left, line.ljust(max_length), right]) for line in txt]

        # Add the speech bubble top-bottom boundaries and combine
        speech_bubble = "\n".join(
            ["".join([" ", top * (max_length + 2), " "])]
            + txt
            + ["".join([" ", bottom * (max_length + 2), " "])]
            + [_BUBBLE_TAIL_TEMPLATE.format(tail, tail)]
        )

        out = "".join([speech_bubble, _SPONGEBOB_ASCII])

        if print_:
            print(out)

        return out

    return ascii_func


spongebobsay = _ascii_func_factory(left="|", right="|", top="-", bottom="-", tail="\\\\")

spongebobthink = _ascii_func_factory(left="(", right=")", top="~", bottom="~", tail=" o")

spongebobwhisper = _ascii_func_factory(left=":", right=":", top=".", bottom=".", tail=" .")


def ascii_spongebob(print_: bool = True):
    out = "     " + _SPONGEBOB_ASCII
    if print_:
        print(out)
    return out
