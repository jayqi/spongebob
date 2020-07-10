from pathlib import Path
import random
from typing import Optional

from spongebobcase import spongebobsay, spongebobthink, spongebobwhisper, tospongebob
import typer


app = typer.Typer()


with (Path(__file__).parent / "VERSION").open("r") as fp:
    __version__ = fp.read().strip()


def version_callback(value: bool):
    if value:
        typer.echo(__version__)
        raise typer.Exit()


@app.command()
def main(
    what: str = typer.Argument(
        ...,
        help=(
            "Text to say. If your input text contains spaces, you will need to wrap it with "
            "quotes."
        ),
    ),
    width: Optional[int] = typer.Option(
        None, "--width", "-W", help="Width of speech bubble (number of characters)."
    ),
    think: bool = typer.Option(False, "--think", "-t", help="Use thought bubble."),
    whisper: bool = typer.Option(False, "--whisper", "-w", help="Use whisper bubble."),
    no_ascii: bool = typer.Option(
        False, "--no-ascii", "-n", help="Text-only with no ASCII art. Ignores width option."
    ),
    random_seed: Optional[int] = typer.Option(None, "--random-seed", "-s", help="Random seed."),
    version: bool = typer.Option(
        False,
        "--version",
        callback=version_callback,
        is_eager=True,
        help="Show spongebobsay version and exit.",
        show_default=False,
    ),
):
    """Generate an ASCII picture of Spongebob saying something provided by the user, but in Mocking
    Spongebob case.

    geNerATe aN AScIi pICtuRE of sPoNGebOB sAyIng SOMeThIng ProvIDeD by THe usER, BuT iN mOcKing
    SpONGeboB caSE.
    """
    if sum([think, whisper, no_ascii]) > 1:
        typer.echo("Error: Only one of --think, --whisper, or --no-ascii can be used at a time.")
        raise typer.Exit(code=2)

    random.seed(random_seed)
    if think:
        out = spongebobthink(what=what, print_=False, width=width)
    elif whisper:
        out = spongebobwhisper(what=what, print_=False, width=width)
    elif no_ascii:
        out = tospongebob(what)
    else:
        out = spongebobsay(what=what, print_=False, width=width)

    typer.echo(out)
