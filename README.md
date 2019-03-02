# spongebob : SPoNgeBOb-CAse cONveRSioN iN R

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-last-release/spongebob)](https://cran.r-project.org/package=spongebob) [![CRAN\_Download\_Badge](https://cranlogs.r-pkg.org/badges/grand-total/spongebob)](https://cran.r-project.org/package=spongebob) [![Build Status](https://travis-ci.org/jayqi/spongebob.svg?branch=master)](https://travis-ci.org/jayqi/spongebob) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jayqi/spOngEbOB?branch=master&svg=true)](https://ci.appveyor.com/project/jayqi/spOngEbOB) [![codecov](https://codecov.io/gh/jayqi/spongebob/branch/master/graph/badge.svg)](https://codecov.io/gh/jayqi/spongebob)

This R package's core is the function `tospongebob` that will convert text in R objects to [Mocking SpongeBob case](https://knowyourmeme.com/memes/mocking-spongebob). Additional features leverage it for even more fun. 

insPIreD bY A [twiTTeR CoNVErsaTIon StArtED By @jONgAllOwaY](https://twitter.com/jongalloway/status/1075889210714816512).

## Installation. inSTAllATIoN.

You can get the lATEst STAbLE vERsION of `spongebob` from [CRAN](https://CRAN.R-project.org/package=spongebob):

``` r
install.packages('spongebob')
```

### Development Version. dEveLoPmEnT VerSIOn.

To install the dEveLoPmEnT VerSIOn of this package, use `remotes` to install DirEcTlY fROm gItHuB:

``` r
remotes::install_github("jayqi/spongebob")
```

## Usage. usAGe.

``` r
library(spongebob)
tospongebob(c(
    "an r package for spongebob-case conversion",
    "try to use it on anything you'd like!"
))
#> [1] "AN r pAcKaGe FOr spOnGebOb-caSe CONvERsioN"
#> [2] "tRy to USe iT on AnytHInG yOU'D lIKe!"

tospongebob(summary(datasets::chickwts))
#>      WeigHt             FeED   
#>  MIn.   :108.0   CaSein   :12  
#>  1sT qU.:204.5   HOrseBEaN:10  
#>  meDIan :258.0   LinSEeD  :12  
#>  mEan   :261.3   MeaTMeAL :11  
#>  3Rd QU.:323.5   SOYbEaN  :14  
#>  max.   :423.0   sunFLowEr:12

spongebobsay("you can even make magnificent ascii art")
#>  ----------------------------------------- 
#> | yOU CaN eVEn maKe MAgnIfICEnT ascIi ARt |
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
```

<sup>Snippet created on 2019-03-02 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>

---

<sup>The author of this package claims no ownership over SpongeBob SquarePants. SpongeBob SquarePants is the creation of Stephen Hillenburg, and its trademark is owned by Viacom International Inc. This package uses SpongeBob under fair use, and this package should only be used for personal, noncommercial purposes.</sup>
