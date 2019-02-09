# SpongeBob ASCII template
# First line missing three additional characters on the left side
# To make space for speech bubble tail
.SPONGEBOB_ASCII <- ("    *
          *
     ----//-------
     \\..C/--..--/ \\   `A
      (@ )  ( @) \\  \\// |w
       \\          \\  \\---/
        HGGGGGGG    \\    /`
        V `---------`--'
            <<    <<
           ###   ###
")

# Speech bubble tail ASCII template
# Blanks should be replaced with two-symbol character strings
.BUBBLE_TAIL_TEMPLATE <- "  %s\n   %s"

# Maximum allowed width for speech bubble content
.MAX_ALLOWED_WIDTH <- 40

# Generator function for SpongeBob ASCII speech functions
# Takes character strings defining symbols that will be the left boundary,
# right boundary, and tail of the speech bubble
# Returns a closure that takes a character string input
.make_ascii_maker <- function(left, right, top, bottom, tail) {
    # Input validation
    # TODO: Input validation. is.character, length == 1, nchar == 1 or 2

    # Closure
    function (what, print = TRUE) {

        # Input validation
        if (!is.character(what) | length(what) != 1) {
            msg <- "Input what is not a length-1 character string."
            stop(paste(msg, tospongebob(msg)))
        }
        if (!is.logical(print) | length(print) != 1) {
            msg <- "Argument print is not a length-1 logical."
            stop(paste(msg, tospongebob(msg)))
        }

        # Split text up into lines
        txt <- strwrap(what, width = .MAX_ALLOWED_WIDTH)
        txt <- tospongebob(txt)
        maxLength <- max(nchar(txt))

        # Right now this doesn't support words longer than .MAX_ALLOWED_WIDTH
        # Someday maybe we will split up long words
        if (maxLength > .MAX_ALLOWED_WIDTH) {
            msg <- paste(
                "Sorry, spongebobsay does not support input with words longer than"
                , sprintf("%d characters.", .MAX_ALLOWED_WIDTH)
            )
            stop(paste(msg, tospongebob(msg)))
        }

        # Add the speech bubble left-right boundaries
        txt <- sprintf(sprintf("%%-%ds", maxLength), txt)
        txt <- paste(left, txt, right)

        # Add the speech bubble top-bottom boundaries and combine
        speechBubble <- paste(
            paste(c(" ", rep(top, maxLength + 2), " "), collapse = "")
            , paste(txt, collapse = "\n")
            , paste(c(" ", rep(bottom, maxLength + 2), " "), collapse = "")
            , sprintf(.BUBBLE_TAIL_TEMPLATE, tail, tail)
            , sep = "\n"
        )

        out <- paste0(speechBubble, .SPONGEBOB_ASCII)

        # Print output using cat
        if (print) {cat(out)}

        return(invisible(out))
    }
}

#' @title SpongeBob ASCII Messages : sPongEBoB aScii MesSAgEs
#' @name spongebobsay
#' @rdname spongebobsay
#' @aliases spongebobsay
#' @aliases spongebobthink
#' @description A set of functions that generate SpongeBob ASCII art with speech
#' bubbles in the style of \href{https://en.wikipedia.org/wiki/Cowsay}{cowsay}.
#'
#' a seT OF fuNctiOnS tHat GEnerAte sPONgeBOb AScIi aRT wiTH SpeEcH buBBLeS In
#' THe sTylE OF \href{https://en.wikipedia.org/wiki/Cowsay}{cOWsaY}.
#' @param what a length-1 character string. A leNGTh-1 chARActeR StRInG.
#' @param print a length-1 logical flag for whether to print output to console.
#' A LenGTH-1 lOGicaL flaG foR wHethEr tO prInT ResUlt TO cONsolE.
#' @return a character string containing the ASCII art. Use
#' \code{\link[base]{cat}} to print with proper formatting.
#'
#' A CHaRACtER stRINg cONtaINiNG ThE ASciI ARt. uSe \code{\link[base]{cat}} TO
#' prInT WiTH prOper FORmatTiNg.
NULL

#' @rdname spongebobsay
#' @examples
#' spongebobsay("globalVariables is a hideous hack and I will never use it.")
#'
#' @export
spongebobsay <- .make_ascii_maker(left = "|"
                                  , right = "|"
                                  , top = "-"
                                  , bottom = "-"
                                  ,  tail = "\\\\")

#' @rdname spongebobsay
#' @examples
#' spongebobthink(
#'     "@hadley you shouldn't say you'll never use things when only two years
#'     later you think it's fine -- hadley"
#' )
#'
#' @export
spongebobthink <- .make_ascii_maker(left = "("
                                    , right = ")"
                                    , top = "~"
                                    , bottom = "~"
                                    , tail = " o")

#' @rdname spongebobsay
#' @examples
#' spongebobwhisper(
#'     "it's still a hideous hack, but you just have to suck it up if you want
#'     your package on CRAN"
#' )
#'
#' @export
spongebobwhisper <- .make_ascii_maker(left = ":"
                                    , right = ":"
                                    , top = "."
                                    , bottom = "."
                                    , tail = " .")

#' @title ASCII Spongebob
#' @name ascii_spongebob
#' @description ASCII Mocking Spongebob used by \code{\link{spongebobsay}}.
#' @param print a length-1 logical flag for whether to print output to console.
#' A LenGTH-1 lOGicaL flaG foR wHethEr tO prInT ResUlt TO cONsolE.
#' @return a character string containing the ASCII art. Use
#' \code{\link[base]{cat}} to print with proper formatting.
#'
#' A CHaRACtER stRINg cONtaINiNG ThE ASciI ARt. uSe \code{\link[base]{cat}} TO
#' prInT WiTH prOper FORmatTiNg.
#' @examples
#' ascii_spongebob()
#'
#' art <- ascii_spongebob(print = FALSE)
#' cat(art)
#' @export
ascii_spongebob <- function(print = TRUE) {
    if (!is.logical(print) | length(print) != 1) {
        msg <- "Argument print is not a length-1 logical."
        stop(paste(msg, tospongebob(msg)))
    }
    out <- paste0("     ", .SPONGEBOB_ASCII)
    if (print) {cat(out)}
    return(invisible(out))
}
