# spongebobsay: AScIi MOcKiNg sPONgEbOB comMAnD-lIne ProGrAm

[![tests-spongebobsay-cli](https://github.com/jayqi/spongebob/workflows/tests-spongebobsay-cli/badge.svg?branch=master)](https://github.com/jayqi/spongebob/actions?query=workflow%3Atests-spongebobsay-cli+branch%3Amaster) [![PyPI](https://img.shields.io/pypi/v/spongebobsay.svg)](https://pypi.org/project/spongebobsay/)

Command-line program for generating an ASCII picture of SpongeBob saying a message, but in [Mocking SpongeBob case](https://knowyourmeme.com/memes/mocking-spongebob).

```
 -----------------------------------------
| COmmAnd-lINE prOgraM FOr GEnErATiNg an  |
| AScIi pIcTUrE OF sPonGEBoB sAyIng A     |
| mEssaGe, BuT IN mOCKinG SponGeboB CasE. |
 -----------------------------------------
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

Also available as a [Python library (`spongebobcase`)](https://github.com/jayqi/spongebob/tree/master/py-pkg) or [R library (`spongebob`)](https://github.com/jayqi/spongebob/tree/master/r-pkg). This CLI wraps the `spongebobcase` Python library.


## Installation. inSTAllATIoN.

You can get the LateST StABle VeRsIon of `spongebobsay` from PyPI.

```bash
pip install spongebobsay
```

For managing pyTHon cOMmanD-lINE tOOls, I recommend checking out [`pipx`](https://github.com/pipxproject/pipx):

```bash
pipx install spongebobsay
```

Requires Python 3.6 or higher.

### Development Version. dEveLoPmEnT VerSIOn.

To install the dEveLoPmEnT VerSIOn of this program, get it DirEcTlY fROm gItHuB:

```bash
pipx install -e git+https://github.com/jayqi/spongebob.git#egg=version_subpkg&subdirectory=py-pkg
```

## Usage

```bash
spongebobsay "Who lives in a pineapple under the sea?"
```

```
 -----------------------------------------
| WHo liVes iN a pIneAPplE uNDeR thE sEA? |
 -----------------------------------------
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

## Documentation

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
  --version                       Show spongebobsay version and exit.
  --install-completion [bash|zsh|fish|powershell|pwsh]
                                  Install completion for the specified shell.
  --show-completion [bash|zsh|fish|powershell|pwsh]
                                  Show completion for the specified shell, to
                                  copy it or customize the installation.

  --help                          Show this message and exit.
```

insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY](https://twitter.com/jongalloway/status/1075889210714816512) AnD THe fAMOuS [cOWsAY](https://en.wikipedia.org/wiki/Cowsay) pROGraM.

---

<sup>The author of this package claims no ownership over SpongeBob SquarePants. SpongeBob SquarePants is the creation of Stephen Hillenburg, and its trademark is owned by Viacom International Inc. This package uses SpongeBob under fair use, and this package should only be used for personal, noncommercial purposes.</sup>
