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
    vapply(
        x
        , FUN = function(s) {
            chars <- unlist(strsplit(s, split = character(0)))
            lengthSeq <- {
                seq <- c()
                while (sum(seq) < length(chars)) {
                    nextval <- sample(1:3, 1, prob = c(0.4, 0.35, 0.25))
                    if (sum(seq) + nextval <= length(chars)) {
                        seq <- c(seq, nextval)
                    }
                }
                seq
            }
            newChars <- c()
            lower <- TRUE
            for (segInd in seq_along(lengthSeq)) {
                startInd <- sum(lengthSeq[1:segInd-1]) + 1
                endInd <- sum(lengthSeq[1:segInd])
                newChars <- c(newChars, {
                    if (lower) {
                        tolower(chars[startInd:endInd])
                    } else {
                        toupper(chars[startInd:endInd])
                    }})
                lower <- !lower
            }
            return(paste(newChars, collapse = ""))
        }
        , character(1)
        , USE.NAMES = FALSE
    )
}
