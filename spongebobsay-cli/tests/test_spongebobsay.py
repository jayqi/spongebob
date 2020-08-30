from itertools import combinations
import random
import subprocess

import pytest
from typer.testing import CliRunner

from spongebobsay.spongebobsay import app, __version__
from spongebobcase import spongebobsay, spongebobthink, spongebobwhisper, tospongebob

RANDOM_SEED = 29_998_559_671_349


def test_help():
    """Test the CLI with --help flag."""
    result = CliRunner().invoke(app, ["--help"])
    assert result.exit_code == 0
    assert "Generate an ASCII picture of Spongebob" in result.output


def test_version():
    """Test the CLI with --version flag."""
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.output.strip() == __version__


test_cases = [
    ([], spongebobsay),
    (["--think"], spongebobthink),
    (["--whisper"], spongebobwhisper),
    (["--no-ascii"], tospongebob),
]

TEST_STRING = (
    "Who lives in a pinneapple under the sea? "
    "Spongebob Squarepants! "
    "Absorbent and yellow and porous is he? "
    "Spongebob Squarepants!"
)


@pytest.mark.parametrize("cmd_flags, expected_func", test_cases)
def test_command(cmd_flags, expected_func):
    """Test the CLI with each styling flag."""

    result = CliRunner().invoke(app, cmd_flags + ["-s", RANDOM_SEED] + [TEST_STRING])
    assert result.exit_code == 0

    random.seed(RANDOM_SEED)
    expected = expected_func(TEST_STRING) + "\n"

    assert result.output == expected


@pytest.mark.parametrize("cmd_flags, expected_func", test_cases)
def test_command_python_m(cmd_flags, expected_func):
    """Test the CLI using python -m invocation with each styling flag."""
    result = subprocess.run(
        ["python", "-m", "spongebobsay"] + cmd_flags + ["-s", str(RANDOM_SEED)] + [TEST_STRING],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
    )
    assert result.returncode == 0

    random.seed(RANDOM_SEED)
    expected = expected_func(TEST_STRING)

    assert result.stdout == expected + "\n"


def test_random_seed():
    """Test that setting a random seed consistently produces the same thing."""
    output_set = set()
    for _ in range(10):
        result = CliRunner().invoke(app, ["-s", RANDOM_SEED] + [TEST_STRING])
        assert result.exit_code == 0
        output_set.add(result.output)
    assert len(output_set) == 1


def test_no_random_seed():
    """Test that not setting a random seed does not consistently produces the same thing."""
    output_set = set()
    for _ in range(10):
        result = CliRunner().invoke(app, [TEST_STRING])
        assert result.exit_code == 0
        output_set.add(result.output)
    assert len(output_set) == 10


def test_error_no_input():
    result = CliRunner().invoke(app, [])
    assert result.exit_code == 2
    assert "Error: Missing argument 'WHAT'." in result.output


@pytest.mark.parametrize(
    "style_flag_1, style_flag_2", combinations(["--think", "--whisper", "--no-ascii"], 2)
)
def test_error_two_flags(style_flag_1, style_flag_2):
    result = CliRunner().invoke(app, [style_flag_1, style_flag_2, TEST_STRING])
    assert result.exit_code == 2
    assert "Error: Only one of" in result.output


def test_error_all_flags():
    result = CliRunner().invoke(app, ["--think", "--whisper", "--no-ascii", TEST_STRING])
    assert result.exit_code == 2
    assert "Error: Only one of" in result.output
