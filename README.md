# spongebob : aN R spOngEboB-CASe CoNVertOR

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-last-release/spongebob)](https://cran.r-project.org/package=spongebob) [![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/spongebob)](https://cran.r-project.org/package=spongebob) [![Build Status](https://travis-ci.org/jayqi/spongebob.svg?branch=master)](https://travis-ci.org/jayqi/spongebob) [![codecov](https://codecov.io/gh/jayqi/spongebob/branch/master/graph/badge.svg)](https://codecov.io/gh/jayqi/spongebob)

This R package provides a function `tospongebob` that will convert character strings to [Mocking Spongebob case](https://knowyourmeme.com/memes/mocking-spongebob).

thIS r PACkaGe PRovIdES a fuNctiOn `TOSpoNgeBOb` THAt WiLL ConvErT cHaRAcTER stRINgs TO [MocKINg SponGEBob CASe](https://knowyourmeme.com/memes/mocking-spongebob).

Inspired by a [Twitter conversation started by @jongalloway](https://twitter.com/jongalloway/status/1075889210714816512).

insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY](https://twitter.com/jongalloway/status/1075889210714816512).

## Installation. inSTAllATIoN.

You can get `spongebob` from [CRAN](https://CRAN.R-project.org/package=spongebob):

YoU cAn GeT `spongebob` FrOM [CRAn](https://CRAN.R-project.org/package=spongebob):

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
    "This R package provides a function `tospongebob` that will convert character strings to [Mocking Spongebob case]",
    "Inspired by a [Twitter conversation started by @jongalloway]",
    "To install the development version of this package, use `remotes` to install directly from GitHub:"
))
#> [1] "thIs R PacKaGe PROviDEs A FuNCtIOn `toSPoNGEboB` thaT wILl CONvErT CharACTeR stRiNgS tO [MOckInG SponGEboB CasE]"
#> [2] "insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY]"
#> [3] "tO InSTaLl thE devELoPmEnT VerSiON of ThiS pACkAGE, usE `REmOteS` To InSTaLl DirEcTlY fROm gItHuB:"
```
<sup>Created on 2019-01-15 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>
