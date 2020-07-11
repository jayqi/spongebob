# spongebobcase: SPoNgeBOb-CAse cONveRSioN iN PyTHoN

[![tests-py-pkg](https://github.com/jayqi/spongebob/workflows/tests-py-pkg/badge.svg?branch=master)](https://github.com/jayqi/spongebob/actions?query=workflow%3Atests-py-pkg+branch%3Amaster) [![PyPI](https://img.shields.io/pypi/v/spongebobcase.svg)](https://pypi.org/project/spongebobcase/)

A Python library to convert text (and text in objects) to [Mocking SpongeBob case](https://knowyourmeme.com/memes/mocking-spongebob) and show it off in fun ways.

Also available [as an R library (`spongebob`)](https://github.com/jayqi/spongebob/tree/master/r-pkg) or [as a CLI (`spongebobsay`)](https://github.com/jayqi/spongebob/tree/master/spongebobsay-cli).

## Installation. inSTAllATIoN.

You can get the LateST StABle VeRsIon of `spongebobcase` from PyPI:

```bash
pip install spongebobcase
```

Requires Python 3.6 or higher.

### Development Version. dEveLoPmEnT VerSIOn.

To install the dEveLoPmEnT VerSIOn of this package, get it DirEcTlY fROm gItHuB:

```bash
pip install -e git+https://github.com/jayqi/spongebob.git#egg=version_subpkg&subdirectory=py-pkg
```


## Usage. usAGe.

```python
from spongebobcase import tospongebob
tospongebob("a python library for spongebob-case conversion")
#> 'a PYthOn LIBraRY For sPoNgebOb-CaSe ConVERsiOn'
tospongebob(["try it on anything with strings!", "hopefully it will work!"])
#> ['tRY It ON anYThiNG wIth STRiNgs!', 'hoPeFULlY it Will WoRK!']
```

```python
from spongebobcase import spongebobsay
_ = spongebobsay("you can even make magnificent ascii art")
#>  -----------------------------------------
#> | YoU CAn eVeN mAKe MAgnIFiCEnT ascII ArT |
#>  -----------------------------------------
#>   \\
#>    \\    *
#>           *
#>      ----//-------
#>      \..C/--..--/ \   `A
#>       (@ )  ( @) \  \// |w
#>        \          \  \---/
#>         HGGGGGGG    \    /`
#>         V `---------`--'
#>             <<    <<
#>            ###   ###
#>
```

<sup>Snippets created on 2020-07-09 by the [reprexpy package](https://github.com/crew102/reprexpy)</sup>

insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY](https://twitter.com/jongalloway/status/1075889210714816512).

---

<sup>The author of this package claims no ownership over SpongeBob SquarePants. SpongeBob SquarePants is the creation of Stephen Hillenburg, and its trademark is owned by Viacom International Inc. This package uses SpongeBob under fair use, and this package should only be used for personal, noncommercial purposes.</sup>
