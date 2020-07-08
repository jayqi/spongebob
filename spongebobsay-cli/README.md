# spongebobsay: asCIi moCkIng SpoNgEbOb CommAnD-liNE ProGram

Command-line program to generate an ASCII picture of Spongebob saying something provided by the user, but in Mocking Spongebob case.

```
 ----------------------------------------
| ComManD-Line PROgRAm to GEnerATE aN    |
| asCIi PictUre OF spOnGeBOb SaYiNg      |
| SOMetHInG ProVidED by The uSeR, buT In |
| MockING spONGeBoB cASE.                |
 ----------------------------------------
  \\
   \\    *
          *
     ----//-------
     \..C/--..--/ \   `A
      (@ )  ( @) \  \// |w
       \          \  \---/
        HGGGGGGG    \    /`
        V `---------`--'
            <<    <<
           ###   ###
```

## Installation

This package is currently only on GitHub. Clone this repo, enter the directory, and run.

```bash
pip install .
```

## Usage

```bash
spongebobsay "Who lives in a pineapple under the sea?"
```

### Documentation

```
Usage: spongebobsay [OPTIONS] WHAT

  Generate an ASCII picture of Spongebob saying something provided by the
  user, but in Mocking Spongebob case.

  geNerATe aN AScIi pICtuRE of sPoNGebOB sAyIng SOMeThIng ProvIDeD by THe
  usER, BuT iN mOcKing SpONGeboB caSE.

Arguments:
  WHAT  Text to say. If your input text contains spaces, you will need to wrap
        it with quotes.  [required]


Options:
  -W, --width INTEGER             Width of speech bubble (number of
                                  characters).

  -t, --think                     Use thought bubble.  [default: False]
  -w, --whisper                   Use whisper bubble.  [default: False]
  -n, --no-ascii                  Text-only with no ASCII art. Ignores width
                                  option.  [default: False]

  -s, --random-seed INTEGER       Random seed.
  --version                       Show spongebobsay version.  [default: False]
  --install-completion [bash|zsh|fish|powershell|pwsh]
                                  Install completion for the specified shell.
  --show-completion [bash|zsh|fish|powershell|pwsh]
                                  Show completion for the specified shell, to
                                  copy it or customize the installation.

  --help                          Show this message and exit.
```
