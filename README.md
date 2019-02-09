# spongebob : aN R PaCkaGe foR SpONgEBoB-cASE cONVersIoN

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-last-release/spongebob)](https://cran.r-project.org/package=spongebob) [![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/spongebob)](https://cran.r-project.org/package=spongebob) [![Build Status](https://travis-ci.org/jayqi/spongebob.svg?branch=master)](https://travis-ci.org/jayqi/spongebob) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jayqi/spOngEbOB?branch=master&svg=true)](https://ci.appveyor.com/project/jayqi/spOngEbOB) [![codecov](https://codecov.io/gh/jayqi/spongebob/branch/master/graph/badge.svg)](https://codecov.io/gh/jayqi/spongebob)

This R package's core is the function `tospongebob` that will convert character strings to [Mocking SpongeBob case](https://knowyourmeme.com/memes/mocking-spongebob). Additional features leverage it for even more fun. 

thIS r pAcKAge'S cOrE iS THe fuNcTiOn `tospongebob` ThAt WIlL cOnVerT chaRaCTer sTRingS To [MOcKINg SPOngeBob CASe](https://knowyourmeme.com/memes/mocking-spongebob). aDdITiONaL feATurES leVErAgE IT fOr EVeN MOrE fuN.


Inspired by a [Twitter conversation started by @jongalloway](https://twitter.com/jongalloway/status/1075889210714816512).

insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY](https://twitter.com/jongalloway/status/1075889210714816512).

## Installation. inSTAllATIoN.

You can get `spongebob` from [CRAN](https://CRAN.R-project.org/package=spongebob):

YOu cAN geT `spongebob` fROm [CRan](https://CRAN.R-project.org/package=spongebob):

``` r
install.packages('spongebob')
```

### Development Version. dEveLoPmEnT VerSIOn.

To install the development version of this package, use `remotes` to install directly from GitHub:

tO InSTaLl thE devELoPmEnT VerSiON of ThiS pACkAGE, usE `remotes` To InSTaLl DirEcTlY fROm gItHuB:

``` r
remotes::install_github("jayqi/spongebob")
```

## Usage. usAGe.

``` r
library(spongebob)
tospongebob(c(
    "an r package for spongebob-case conversion",
    "Inspired by a [Twitter conversation started by @jongalloway]"
))
#> [1] "aN r PaCkaGe foR SpONgEBoB-cASE cONVersIoN"
#> [2] "insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY]"
```
<sup>Created on 2019-02-09 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>

---

<sup>The author of this package claims no ownership over SpongeBob SquarePants. SpongeBob SquarePants is the creation of Stephen Hillenburg, and its trademark is owned by Viacom International Inc. This package uses SpongeBob under fair use, and this package should only be used for personal, noncommercial purposes.</sup>
