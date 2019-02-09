#' @title SpongeBob-Case Conversion : sPOngEBOb-CasE cOnVErsIoN
#' @name tospongebob
#' @description Translate character vectors to
#' \href{https://knowyourmeme.com/memes/mocking-spongebob}{Mocking SpongeBob
#' case}.
#'
#' tRANsLate ChaRACtER vECtoRs tO
#' \href{https://knowyourmeme.com/memes/mocking-spongebob}{mOcKiNg spOngeBoB
#' caSe}.
#' @param x a character vector. A CHarACTer vEcToR.
#' @return A character vector of the same length as \code{x}.
#'
#' a ChaRaCteR vecTor OF The SAme LenGth As \code{x}.
#' @examples
#' tospongebob("SpongeBob-Case Conversion")
#' tospongebob(x = c(
#'     "Translate character vectors to Mocking SpongeBob case",
#'     "a character vector.",
#'     "A character vector of the same length as"
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
            phi <- (1 + sqrt(5))/2 # Golden ratio
            probVec <- c(0.5, 0.5/phi, 0.5/phi^2) # sums to 1
            lengthSeq <- c()
            while (sum(lengthSeq) < length(alphaInds)) {
                nextval <- sample(1:3, 1, prob = probVec)
                if (sum(lengthSeq) + nextval <= length(alphaInds)) {
                    lengthSeq <- c(lengthSeq, nextval)
                }
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
        } # end FUN for one string

        , FUN.VALUE = character(1)
        , USE.NAMES = FALSE
    )
}
