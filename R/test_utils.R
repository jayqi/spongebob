


# Generate single word of random letters of length len
.generate_word <- function(len = 10) {
    paste(sample(letters, len, replace = TRUE), collapse = "")
}

# Generate sequence of random-letter words based on vector of word lengths
.generate_sentence <- function(lenVec = c(10, 15, 5)) {
    paste(vapply(X = lenVec
           , FUN = .generate_word
           , FUN.VALUE = character(1)
           , USE.NAMES = FALSE
    ), collapse = " ")
}
