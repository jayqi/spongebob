import pytest

from spongebobcase.spongebobsay import (
    ascii_spongebob,
    spongebobsay,
    spongebobthink,
    spongebobwhisper,
    WidthTooSmallError,
)


@pytest.mark.parametrize("ascii_func", [spongebobsay, spongebobthink, spongebobwhisper])
def test_ascii_function(ascii_func):
    test_string = (
        "Who lives in a pinneapple under the sea? "
        "Spongebob Squarepants! "
        "Absorbent and yellow and porous is he? "
        "Spongebob Squarepants!"
    )
    result = ascii_func(test_string)
    assert isinstance(result, str)
    assert len(result) > len(test_string)


@pytest.mark.parametrize("width", [15, 30, 45, 60, 90])
def test_width(width):
    test_string = (
        "Who lives in a pinneapple under the sea? "
        "Spongebob Squarepants! "
        "Absorbent and yellow and porous is he? "
        "Spongebob Squarepants!"
    )
    result_lines = spongebobsay(test_string, width=width).split("\n")
    speech_lines_lengths = {
        len(line) - 4 for line in result_lines if line.startswith("| ") and line.endswith(" |")
    }
    assert len(speech_lines_lengths) == 1
    assert speech_lines_lengths.pop() < width


def test_error_width_too_small():
    test_string = " ".join(["a" * 5, "b" * 20, "c" * 5])

    with pytest.raises(WidthTooSmallError) as e:
        spongebobsay(test_string, width=10)
    assert "10" in str(e.value)
    assert "b" * 20 in str(e.value).lower()
    assert "20" in str(e.value)


def test_ascii_spongebob():
    result = ascii_spongebob()
    assert isinstance(result, str)
    assert len(result) > 0
