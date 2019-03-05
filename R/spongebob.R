#' @title spongebob : SPoNgeBOb-CAse cONveRSioN
#' @keywords internal
#' @description Convert text (and text in R objects) to
#'    \href{https://knowyourmeme.com/memes/mocking-spongebob}{Mocking SpongeBob
#'    case} and show it off in fun ways.
#'
#'    cONveRT TeXT (anD tEXt IN r obJEcTS) to
#'    \href{https://knowyourmeme.com/memes/mocking-spongebob}{mOCkinG spOngEBoB
#'    cASe} aNd shOW it OFf in FuN waYS.
#'
#' @section tospongebob -- teXt CoNVeRSIoN:
#'
#'    The core of this package is the \code{\link{tospongebob}} function. You
#'    can use it to convert character vectors! For example,
#'
#'    \preformatted{
#'        tospongebob('use it to convert character vectors!')
#'
#'        #> [1] "uSe iT to ConvERt chArACteR vECTorS!"
#'    }
#'
#'    BuT WAiT! \code{tospongebob} is actually an S3 generic function. You can
#'    use it to convert lots of things!
#'
#'    \preformatted{
#'        tospongebob(summary(datasets::chickwts))
#'
#'        #>      WeigHt             FeED
#'        #>  MIn.   :108.0   CaSein   :12
#'        #>  1sT qU.:204.5   HOrseBEaN:10
#'        #>  meDIan :258.0   LinSEeD  :12
#'        #>  mEan   :261.3   MeaTMeAL :11
#'        #>  3Rd QU.:323.5   SOYbEaN  :14
#'        #>  max.   :423.0   sunFLowEr:12
#'    }
#'
#'    Try to convert aNyThiNg yOU CaN dREAm oF. If you dream of
#'    something that doesn't work, please report it in our
#'    \href{https://github.com/jayqi/spongebob/issues}{issue tracker},
#'    and we'll try our best to mAKe yoUr drEaMS ComE TrUE. DOn'T LeT yOUR
#'    dreAmS juST Be DrEaMS.
#'
#' @section spongebobsay -- aScIi SPOnGeBOB:
#'
#'   We also have functions for getting your text spoken by an ASCII Mocking
#'   Spongebob, in the style of
#'   \href{https://en.wikipedia.org/wiki/Cowsay}{cowsay}.
#'
#'   \preformatted{
#'       spongebobsay("you can even make magnificent ascii art")
#'
#'       #>  -----------------------------------------
#'       #> | yOU CaN eVEn maKe MAgnIfICEnT ascIi ARt |
#'       #>  -----------------------------------------
#'       #>   \\
#'       #>    \\    *
#'       #>           *
#'       #>      ----//-------
#'       #>      \..C/--..--/ \   `A
#'       #>       (@ )  ( @) \  \// |w
#'       #>        \          \  \---/
#'       #>         HGGGGGGG    \    /`
#'       #>         V `---------`--'
#'       #>             <<    <<
#'       #>            ###   ###
#'   }
#'
#'   We even have several functions with DiFfEREnT SpEeCh BuBbLE StYlES! Check
#'   them out:
#'
#'   \itemize{
#'       \item{\code{\link{spongebobsay}}}
#'       \item{\code{\link{spongebobwhisper}}}
#'       \item{\code{\link{spongebobthink}}}
#'   }
#'
"_PACKAGE"
