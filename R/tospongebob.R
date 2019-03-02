#' @title SpongeBob-Case Conversion : sPOngEBOb-CasE cOnVErsIoN
#' @name tospongebob
#' @description \code{tospongebob} is an S3 generic function for converting text
#' in R objects to \href{https://knowyourmeme.com/memes/mocking-spongebob}{
#' Mocking SpongeBob case}. The core method for character vectors will return
#' the input character vector with case-converted elements. For other objects,
#' it will attempt to appropriately find text and convert them.
#'
#' \code{tospongebob} IS an S3 gENErIC FunCtIoN fOR cOnveRtIng Text IN r obJEcts
#' To \href{https://knowyourmeme.com/memes/mocking-spongebob}{MocKinG SpOnGEbob
#' CasE}. tHe cOrE MEtHOd FoR CharActEr VECtorS wIll RetURN tHe INPuT chARaCTer
#' VEcTOr WItH cASe-cONVeRTed ELeMenTS. foR oThER objECTs, iT wIlL aTtemPT tO
#' APprOPrIAtELy fInd tEXt aNd cONvERT tHEm.
#' @param x object with text to be converted to Mocking SpongeBob case.
#' @param ... onlY hERe tO sATisFy R CMd CHeCk.
#' @return object with its text converted to Mocking SpongeBob case. ObjECt WiTH
#' iTS tEXt CONvErTeD TO mOCkinG SponGEBob CasE.
#' @details This section describes the (non-exported) S3 methods in more detail.
#'
#' The core \bold{\code{\link{tospongebob.character}}} method takes an input character
#' vector and returns the same vector with its elements converted to Mocking
#' SpongeBob case. Names of the vector are also converted unless parameter
#' \code{convert.names = FALSE}. This method is then leveraged by all other
#' methods.
#'
#' The default \bold{\code{\link{tospongebob.default}}} method will iterate through any
#' elements of list-like objects and attempt to convert those. It will also
#' convert the names of the object unless parameter \code{convert.names = FALSE}.
#' NULL values are passed through as NULL.
#'
#' Additional S3 methods for the following classes have been implemented:
#' \describe{
#'     \item{\bold{\code{tospongebob.array}}}{: convert data and dimnames of an
#'     array}
#'     \item{\bold{\code{\link{tospongebob.data.frame}}}}{: convert row names,
#'     column names, and convertible columns of a data.frame}
#'     \item{\bold{\code{tospongebob.environment}}}{: create a copy of an
#'     environment with its objects converted}
#'     \item{\bold{\code{tospongebob.factor}}}{: convert levels of factor
#'     vectors}
#'     \item{\bold{\code{tospongebob.fortune}}}{: convert the content of a
#'     \link[fortunes:fortunes]{fortunes::fortune} object}
#'     \item{\bold{\code{tospongebob.function}}}{: deparse function into a
#'     character vector, convert, and then combine into one string block}
#'     \item{\bold{\code{tospongebob.ggplot}}}{: convert text labels in
#'     \code{\link[ggplot2:ggplot]{ggplot2::ggplot}} object}
#'     \item{\bold{\code{matrix}}}{: convert data and dimnames of a
#'     matrix}
#'     \item{\bold{\code{tospongebob.table}}}{: convert data and dimnames of a
#'     table}
#' }
#' @examples
#' tospongebob("SpongeBob-Case Conversion")
#' tospongebob(c("S3 generic function", "Mocking SpongeBob case"))
#'
#' tospongebob(packageDescription("base"))
#'
#' df <- head(datasets::CO2)
#' tospongebob(df)
#'
#' tospongebob(summary(df))
#'
#' nicktoons <- list(
#'     spongebob = list(
#'         episodes = c("Help Wanted", "Reef Blower", "Tea at the Treedome"),
#'         characters = c("SpongeBob", "Patrick", "Squidward", "Sandy")
#'     ),
#'     hey_arnold = list(
#'         episodes = c("Downtown as Fruits", "Eugene's Bike"),
#'         characters = c("Arnold", "Gerald", "Helga")
#'     )
#' )
#' tospongebob(nicktoons)
#' @export
tospongebob <- function(x, ...) {
    UseMethod("tospongebob", x)
}


#' @title SpongeBob-Case Conversion for Character Vectors
#' @name tospongebob.character
#' @description Convert character vectors to
#' \href{https://knowyourmeme.com/memes/mocking-spongebob}{Mocking SpongeBob
#' case}. This is an S3 method for character vectors. Generally, you will not be
#' using this method directly; instead, use the S3 generic
#' \code{\link{tospongebob}}. If you really need to use this method, you will
#' need to do \code{spongebob:::tospongebob.character} because it is an internal
#' method.
#' @param x character vector with text to be converted to Mocking SpongeBob case.
#' @param ... onlY hERe tO sATisFy R CMd CHeCk.
#' @param convert.names logical, indicating whether or not to convert the names
#' of the object
#' @return the input vector with its text converted to Mocking SpongeBob case.
#' tHe inPuT VecTor WItH its TeXt ConvErTed To MOckInG SPoNGebOB cASe.
#' @examples
#' spongebob:::tospongebob.character("SpongeBob-Case Conversion")
#' spongebob:::tospongebob.character(c(
#'     "S3 generic function",
#'     "Mocking SpongeBob case"
#' ))
#' @seealso \code{\link{tospongebob}}
#' @export
tospongebob.character <- function(x, ..., convert.names = TRUE) {

    # Input validation
    if (!is.character(x)) {
        msg <- "Input to tospongebob.character is not a character vector."
        stop(paste(msg, tospongebob(msg)))
    }

    # Hold onto names for later. Convert if specified.
    x_names <- names(x)
    if (convert.names & !is.null(x_names)) {
        x_names <- tospongebob(x_names)
    }


    # Vectorized apply to transform each character string
    x <- vapply(x

        # For one character string
        , FUN = function(s) {

            # If NA, just return that back
            if (is.na(s)) {
                return(s)
            }

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
        } # / FUN

        , FUN.VALUE = character(1)
        , USE.NAMES = FALSE
    )

    # Assign converted names if any
    if (!is.null(x_names)) {
        names(x) <- x_names
    }

    return(x)
}


#' @title SpongeBob-Case Conversion for List-like Objects
#' @name tospongebob.default
#' @description Convert list-like objects to
#' \href{https://knowyourmeme.com/memes/mocking-spongebob}{Mocking SpongeBob
#' case}. This is the default S3 method the S3 generic
#' \code{\link{tospongebob}}. Generally, you will not need to use this method
#' directly; instead, use \code{\link{tospongebob}}. If you really need to use
#' this method, you will need to do \code{spongebob:::tospongebob.default}
#' because it is an internal method.
#' @param x object with text to be converted to Mocking SpongeBob case.
#' @param ... onlY hERe tO sATisFy R CMd CHeCk.
#' @param convert.names logical, indicating whether or not to convert the names
#' of the object
#' @return object with its text converted to Mocking SpongeBob case. ObjECt WiTH
#' iTS tEXt CONvErTeD TO mOCkinG SponGEBob CasE.
#' @examples
#' nicktoons <- list(
#'     spongebob = list(
#'         episodes = c("Help Wanted", "Reef Blower", "Tea at the Treedome"),
#'         characters = c("SpongeBob", "Patrick", "Squidward", "Sandy")
#'     ),
#'     hey_arnold = list(
#'         episodes = c("Downtown as Fruits", "Eugene's Bike"),
#'         characters = c("Arnold", "Gerald", "Helga")
#'     )
#' )
#' spongebob:::tospongebob.default(nicktoons)
#' @seealso \code{\link{tospongebob}}
#' @export
tospongebob.default <- function(x, ..., convert.names = TRUE) {
    # If NULL value, nothing to convert
    if (is.null(x)) {
        return(x)
    }

    # Attempt to convert names of object
    if (convert.names) {
        names(x) <- tospongebob(names(x))
    }

    # Iterate through object's elements and attempt to convert recursively
    # Skip numeric, integer, and logical because we can't
    # convert those and don't want to loop over their elements
    # Also skip if that element is NULL because assignment would be removing it
    for (ind in seq_along(x)) {
        if (!is.numeric(x) & !is.integer(x) & !is.logical(x)
            & !is.null(x[[ind]])) {
                x[[ind]] <- tospongebob(x[[ind]])
        }
    }
    return(x)
}

# ==================================
# ========= OTHER METHODS ==========
# ==================================

# == S3 method for arrays ==
# Convert data and dimnames for arrays
#' @rdname tospongebob
#' @export
tospongebob.array <- function(x, ...) {
    data <- tospongebob(as.vector(x))
    dim <- attr(x, 'dim')
    dimnames <- tospongebob(attr(x, 'dimnames'))

    return(array(data = data, dim = dim, dimnames = dimnames))
}


#' @title SpongeBob-Case Conversion for Data Frames
#' @name tospongebob.data.frame
#' @description Convert data.frame objects to
#' \href{https://knowyourmeme.com/memes/mocking-spongebob}{Mocking SpongeBob
#' case}. This is the S3 method for data.frame objects. Generally, you will not
#' be using this method directly; instead, use the S3 generic
#' \code{\link{tospongebob}}. If you really need to use this method, you will
#' need to do \code{spongebob:::tospongebob.data.frame} because it is an
#' internal method.
#'
#' This method will convert character and factor columns to Mocking SpongeBob
#' case. It will also optionlly convert column and row names, enabled by
#' default.
#' @param x data.frame with text to be converted to Mocking SpongeBob case.
#' @param ... onlY hERe tO sATisFy R CMd CHeCk.
#' @param convert.rownames logical, indicating whether or not to convert the
#' row names of the data.frame
#' @param convert.colnames logical, indicating whether or not to convert the
#' column names of the data.frame
#' @return data.frame with its text converted to Mocking SpongeBob case.
#' @examples
#' df1 <- head(datasets::CO2)
#' tospongebob(df1)
#'
#' df2 <- head(datasets::mtcars)
#' tospongebob(df2)
#' @seealso \code{\link{tospongebob}}
#' @export
tospongebob.data.frame <- function(x
                                   , ...
                                   , convert.rownames = TRUE
                                   , convert.colnames = TRUE) {
    # First convert row names
    if (convert.rownames) {
        row.names(x) <- tospongebob(row.names(x))
    }

    # Then use default method to convert column names and columns
    return(tospongebob.default(x, convert.names = convert.colnames))
}

# == S3 method for factors ==
# Convert levels
#' @rdname tospongebob
#' @export
tospongebob.factor <- function(x, ...) {
    levels(x) <- tospongebob(levels(x))
    return(x)
}

# == S3 method for fortunes ==
# Don't convert names because the print.fortune method
# depends on them being named that way
#' @rdname tospongebob
#' @export
tospongebob.fortune <- function(x, ...) {
    # Don't convert names because print.fortune depends on them
    return(tospongebob.default(x, convert.names = FALSE))
}

# == S3 method for environments ==
# Create new env with same parent with all contained objects converted
#' @rdname tospongebob
#' @export
tospongebob.environment <- function(x, ...) {
    e <- new.env(parent = parent.env(x))
    for (objname in ls(x)) {
        assign(
            x = tospongebob(objname)
            , value = tospongebob(get(objname, pos = x))
            , pos = e
        )
    }
    return(e)
}

# == S3 method for functions ==
# Deparse into character vector and convert
# Paste into one block for display
#' @rdname tospongebob
#' @export
tospongebob.function <- function(x, ...) {
    # Deparse into text, convert, and then collapse into one blob
    paste(tospongebob(deparse(x)), collapse = "\n")
}

# == S3 method for ggplot2 plots ==
# Convert plot labels and levels for character/factor variables in data
#' @rdname tospongebob
#' @export
tospongebob.ggplot <- function(x, ...) {
    # Convert plot labels
    x[['labels']] <- tospongebob.default(x[['labels']], convert.names = FALSE)

    # Find character/factor variables in data and convert them
    # Don't convert row or column names because they need to be referenced
    x[['data']] <- tospongebob.data.frame(x[['data']]
                                          , convert.rownames = FALSE
                                          , convert.colnames = FALSE
                                          )

    return(x)
}

# == S3 method for matrix ==
# Convert using array method, since matrix is just special 2D case
#' @rdname tospongebob
#' @export
tospongebob.matrix <- function(x, ...) {
    return(tospongebob.array(x))
}

# == S3 method for tables ==
# Convert using array method, and then change back to a table
#' @rdname tospongebob
#' @export
tospongebob.table <- function(x, ...) {
    arr <- tospongebob.array(x)
    return(as.table(arr))
}
