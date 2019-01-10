# spongebob : aN R spOngEboB-CASe CoNVertOR

[![Build Status](https://travis-ci.org/jayqi/spongebob.svg?branch=master)](https://travis-ci.org/jayqi/spongebob) [![codecov](https://codecov.io/gh/jayqi/spongebob/branch/master/graph/badge.svg)](https://codecov.io/gh/jayqi/spongebob)


This R package provides a function `tospongebob` that will convert character strings to [Spongebob case](https://knowyourmeme.com/memes/mocking-spongebob).

tHis R pAckAGe pROvIDeS a FunCtiOn `tospongebob` THat Will coNVErT cHaRACter STriNGS TO [spONgEBOb casE](https://knowyourmeme.com/memes/mocking-spongebob).

## Installation. inSTAllATIoN.

To install the development version of this package, use `remotes` to install directly from GitHub:

to INstALL thE DevELoPMent veRSiOn oF thiS PaCkagE, uSE `remotes` To iNStaLl DiREctLy FroM giTHUb:

``` r
remotes::install_github("jayqi/spongebob")
```

## Usage. usAGe.

``` r
library(spongebob)
tospongebob(c(
    "This R package provides a function `tospongebob` that will convert character strings to [Spongebob case]",
    "To install the development version of this package, use `remotes` to install directly from GitHub:"
))
#> [1] "tHis R pAckAGe pROvIDeS a FunCtiOn `tOsPOngeBOb` THat Will coNVErT cHaRACter STriNGS TO [spONgEBOb casE]"
#> [2] "to INstALL thE DevELoPMent veRSiOn oF thiS PaCkagE, uSE `RemOTes` To iNStaLl DiREctLy FroM giTHUb:"
```
<sup>Created on 2019-01-09 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>