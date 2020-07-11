from pathlib import Path

from spongebobcase.tospongebob import tospongebob
from spongebobcase.spongebobsay import (
    spongebobsay,
    spongebobthink,
    spongebobwhisper,
    ascii_spongebob,
    WidthTooSmallError,
)


with (Path(__file__).parent / "VERSION").open("r") as fp:
    __version__ = fp.read().strip()


__all__ = [
    tospongebob,
    spongebobsay,
    spongebobthink,
    spongebobwhisper,
    ascii_spongebob,
    WidthTooSmallError,
]
