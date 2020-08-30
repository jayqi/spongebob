from textwrap import wrap
from typing import Any, Optional

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


def _ascii_func_factory(
    name: str, left: str, right: str, top: str, bottom: str, tail: str, style: str
):
    def ascii_func(what: Any, print_: bool = True, width: Optional[int] = None) -> str:
        """Creates an ASCII Mocking SpongeBob with a message in a {style} bubble. The message is
        the string representation of the given input having been converted using
        [tospongebob][spongebobcase.tospongebob].

        Args:
            what (Any): object to display as message
            print_ (bool, optional): whether to print to console using `print`. Defaults to True.
            width (Optional[int], optional): Width of message bubble in characters. If None, will
                use {default_width} or longest word, whichever is longer. Defaults to None.

        Raises:
            WidthTooSmallError: If specified width is less than character length of longest word.

        Returns:
            multiline string with ASCII rendering
        """

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

    ascii_func.__name__ = name
    ascii_func.__doc__ = ascii_func.__doc__.format(style=style, default_width=DEFAULT_WIDTH)
    return ascii_func


spongebobsay = _ascii_func_factory(
    name="spongebobsay", left="|", right="|", top="-", bottom="-", tail="\\\\", style="speech"
)

spongebobthink = _ascii_func_factory(
    name="spongebobthink", left="(", right=")", top="~", bottom="~", tail=" o", style="thought"
)

spongebobwhisper = _ascii_func_factory(
    name="spongebobwhisper", left=":", right=":", top=".", bottom=".", tail=" .", style="whisper"
)


def ascii_spongebob(print_: bool = True) -> str:
    """Get the ASCII SpongeBob without a speech bubble or message.

    Args:
        print_ (bool, optional): Whether to print using the `print` function. Defaults to True.

    Returns:
        multiline string containing ASCII SpongeBob
    """
    out = "     " + _SPONGEBOB_ASCII
    if print_:
        print(out)
    return out
