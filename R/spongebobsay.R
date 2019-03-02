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
.DEFAULT_WIDTH <- 40L

.longest_word <- function(charVec) {
    # Input validation
    if (!is.character(charVec)) {
        msg <- "Something's wrong. Input to .longest_word not character."
        stop(paste(msg, tospongebob(msg)))
    }

    words <- unlist(strsplit(charVec, "\\s+"))

    # words will be null if charVec was character(0)
    # that will have nchar integer(0) so return "" instead
    if (is.null(words)) {
        return("")
    }

    return(words[which.max(nchar(words))])
}

# Generator function for SpongeBob ASCII speech functions
# Takes character strings defining symbols that will be the left boundary,
# right boundary, and tail of the speech bubble
# Returns a closure that takes a character string input
#' @importFrom utils capture.output
.make_ascii_maker <- function(left, right, top, bottom, tail) {
    # Input validation
    # TODO: Input validation. is.character, length == 1, nchar == 1 or 2

    # Closure
    function(what, print = TRUE, width = NULL) {

        # Input validation for parameters
        if (!is.logical(print) | length(print) != 1) {
            msg <- "Argument print is not a length-1 logical."
            stop(paste(msg, tospongebob(msg)))
        }

        # Convert input to SpongeBob case
        # If output is not a character vector, then convert it to
        # one by capturing the output of its print method
        # at a minimum this returns character(0)
        what <- tospongebob(what)
        if (!is.character(what)) {
            what <- utils::capture.output(print(tospongebob(what)))
        }

        # Figure out maximum word
        longestWord <- .longest_word(what)

        # If width is not NULL, validate that it's good
        if (!is.null(width)) {

            # Input validation
            if (length(width) != 1 | !is.numeric(width)) {
                msg <- "Argument width is not a length-1 positive integer"
                stop(paste(msg, tospongebob(msg)))
            }
            if (!identical(width, round(width)) | round(width) < 1) {
                msg <- "Argument width is not a length-1 positive integer"
                stop(paste(msg, tospongebob(msg)))
            }

            # If width is set, validate that it's long enough
            if (width < nchar(longestWord)) {
                msg <- sprintf(
                    "Specified width %d is less than longest word '%s' in input."
                    , width
                    , longestWord
                )
                stop(paste(msg, tospongebob(msg)))
            }

        # Otherwise, set to max between longest word and default
        } else {
            width <- max(.DEFAULT_WIDTH, nchar(longestWord))
        }

        # Split text up into lines by width
        txt <- strwrap(what, width = width)
        txt <- tospongebob(txt)
        maxLength <- max(nchar(txt), 0) # need to account for character(0)

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
#' @param what an object accepted by \code{\link{tospongebob}}
#' @param print a length-1 logical, indicating whether to print output to console.
#' @param width a length-1 positive integer or numeric whole number specifying
#' width to wrap text
#' @return a character string containing the ASCII art. Use
#' \code{\link[base]{cat}} to print with proper formatting.
#'
#' A CHaRACtER stRINg cONtaINiNG ThE ASciI ARt. uSe \code{\link[base]{cat}} TO
#' prInT WiTH prOper FORmatTiNg.
#' @details These functions will convert the input to Mocking SpongeBob case
#' using \code{\link{tospongebob}}. If the converted output is not already a
#' character vector, it will be converted to such using
#' \code{\link[base]{print}}.
#'
#' The ASCII SpongeBob graphic is available standalone using
#' \code{\link{ascii_spongebob}}.
#' @seealso \code{\link{tospongebob}}, \code{\link{ascii_spongebob}}
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

#' @title ASCII Spongebob : AsCIi sPOngEbob
#' @name ascii_spongebob
#' @description ASCII Mocking Spongebob used by \code{\link{spongebobsay}}.
#'
#' aSCIi mOckiNg SPOngEboB uSED bY \code{\link{spongebobsay}}.
#' @param print a length-1 logical flag for whether to print output to console.
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
#' @seealso \code{\link{spongebobsay}}
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
