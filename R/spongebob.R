#' @title sPOnGEBoB-caSE cONVersIon
#' @name tospongebob
#' @description trAnSLaTe ChARAcTers IN chARaCter veCToRS tO sPONgebOB caSe.
#' @param x a ChaRActeR vECtOr.
#' @return a CharAcTeR VECtOR oF THe SamE LeNGTh AS \code{x}.
#' @examples
#' tospongebob("spongebob-case conversion")
#' tospongebob(x = c(
#'     "translate characters in character vectors to spongebob case.",
#'     "a character vector.",
#'     "a character vector of the same length as"
#' ))
#' @export
tospongebob <- function(x) {

    # Input validation
    if (!is.character(x)) {
        msg <- "Input to tospongebob is not a character vector."
        stop(paste(msg, tospongebob(msg)))
    }

    # Vectorized apply to transform each character string
    vapply(x

        # For one string
        , FUN = function(s) {

            # Split up string into characters
            chars <- unlist(strsplit(s, split = character(0)))

            # Get indices of alphabetic characters
            alphaInds <- grep('[[:alpha:]]', chars)

            # Generate a random sequence of 1-, 2-, or 3-length subsequences
            # that sum up to the number of alphabetic characters
            # We will alternate casing of these
            lengthSeq <- {
                seq <- c()
                while (sum(seq) < length(alphaInds)) {
                    nextval <- sample(1:3, 1, prob = c(0.4, 0.35, 0.25))
                    if (sum(seq) + nextval <= length(alphaInds)) {
                        seq <- c(seq, nextval)
                    }
                }
                seq
            }


            # Iterating through the generated subsquences
            lower <- sample(c(TRUE, FALSE), 1) # Initialize starting case
            for (segInd in seq_along(lengthSeq)) {

                # Find the start and end indices by counting and then finding
                # the original indices of that alphabetic-character index
                startInd <- alphaInds[sum(lengthSeq[1:segInd-1]) + 1]
                endInd <- alphaInds[sum(lengthSeq[1:segInd])]

                # Replace characters with lower or uppercase versions
                if (lower) {
                    chars[startInd:endInd] <- tolower(chars[startInd:endInd])
                } else {
                    chars[startInd:endInd] <- toupper(chars[startInd:endInd])
                }

                # Flip case for next iteration
                lower <- !lower
            }

            return(paste(chars, collapse = ""))
        }
        , character(1)
        , USE.NAMES = FALSE
    )
}
