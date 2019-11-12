from .tospongebob import tospongebob
from textwrap import wrap

_DEFAULT_WIDTH = 40

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


def _get_longest_word(what):
    words = what.split()
    return max(words, key=len)


def _make_ascii_maker(left, right, top, bottom, tail):
    def out_func(what, print_=True, width=None):

        # Get string representation of spongbob-ified object
        what = str(tospongebob(what))

        # Get longest word
        longest_word = _get_longest_word(what)

        if width is not None:
            # If width is specified, validate that it's long enough
            assert width >= len(longest_word)
        else:
            # Otherwise, set to max between longest word and default
            width = max((_DEFAULT_WIDTH, len(longest_word)))

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

    return out_func


spongebobsay = _make_ascii_maker(left="|", right="|", top="-", bottom="-", tail="\\\\")

spongebobthink = _make_ascii_maker(left="(", right=")", top="~", bottom="~", tail=" o")

spongebobwhisper = _make_ascii_maker(
    left=":", right=":", top=".", bottom=".", tail=" ."
)
