context("spongebobsay")

### .make_ascii_maker TESTS ###

test_that(".make_ascii_maker runs end-to-end successfully", {
    expect_true({
        ascii_func <- spongebob:::.make_ascii_maker(
            left = "."
            , right = "."
            , top = "."
            , bottom = "."
            , tail = ".."
        )
        is.function(ascii_func)
    })
})

### spongebobsay FAMILY TESTS ###

ascii_spongebob_functions <- c(
    'spongebobsay'
    , 'spongebobwhisper'
    , 'spongebobthink'
)

for (func in ascii_spongebob_functions) {
    for (test in testList) {
        for (inputName in names(test[["input"]])) {
            test_that(sprintf("%s runs end-to-end successfully with dispatch to %s for %s"
                              , func
                              , test[["method"]]
                              , inputName)
                , {
                    # Default params
                    expect_true({
                        invisible(capture.output(
                            tmp <- do.call(
                                what = func
                                , args = list(what = test[["input"]][[inputName]])
                            )
                        ))
                        TRUE
                    }) # /expect_true

                    # Print false
                    expect_true({
                        invisible(capture.output(
                            tmp <- do.call(
                                what = func
                                , args = list(what = test[["input"]][[inputName]]
                                              , print = FALSE
                                              )
                            )
                        ))
                        TRUE
                    }) # /expect_true

                    # Width
                    expect_true({
                        invisible(capture.output(
                            tmp <- do.call(
                                what = func
                                , args = list(what = test[["input"]][[inputName]]
                                              , width = 100
                                )
                            )
                        ))
                        TRUE
                    }) # /expect_true

            }) # /test_that
        } # /for inputName
    } # /for test
} #/for func

test_that("spongebobsay errors for bad print flag", {
    msg <- "not a length-1 logical"
    expect_error(spongebobsay("I'm correct", print = "tricked you"), regexp = msg)
    expect_error(spongebobsay("still correct", print = c(TRUE, TRUE)), regexp = msg)
})

test_that("spongebobsay errors for bad width flag", {
    msg <- "width is not a length-1 positive integer"
    expect_error(spongebobsay("I'm correct", width = "tricked you"), regexp = msg)
    expect_error(spongebobsay("still correct", width = c(40, 50)), regexp = msg)
    expect_error(spongebobsay("okay too", width = 0), regexp = msg)
    expect_error(spongebobsay("also okay", width = 2.5), regexp = msg)
})

test_that("spongebobsay errors for too small a width", {
    msg <- "width 10 is less than longest word"
    expect_error(
        spongebobsay(spongebob:::.generate_sentence(c(5, 15, 10))
                     , width = 10
        )
        , regexp = msg
    )
})


### ascii_spongebob ###

test_that("ascii_spongebob runs end-to-end successfully", {
    expect_true({
        cat("\n")
        invisible(capture.output(ascii_spongebob()))
        TRUE
    })
    expect_true({
        ascii_spongebob(print = FALSE)
        TRUE
    })
})

test_that("ascii_spongebob errors for bad print flag", {
    msg <- "print is not a length-1 logical"
    expect_error(ascii_spongebob("tricked you again"), regexp = msg)
    expect_error(ascii_spongebob(c(TRUE, TRUE)), regexp = msg)
})


### HELPER FUNCTIONS ###

test_that(".longest_word correctly finds longest word", {
    expect_equal(
        object = nchar(spongebob:::.longest_word(
            spongebob:::.generate_sentence(c(10,15,5))
        ))
        , expected = 15
    ) # /expect_equal

    expect_equal(
        object = nchar(spongebob:::.longest_word(c(
            spongebob:::.generate_sentence(c(10,15,5))
            , spongebob:::.generate_sentence(c(3,24,9))
        ))) # /.longest_word
        , expected = 24
    ) # /expect_equal
})

test_that(".longest_word errors for non-character inputs", {
    msg <- "not character"
    expect_error(spongebob:::.longest_word(123), regexp = msg)
    expect_error(spongebob:::.longest_word(c(TRUE, FALSE)), regexp = msg)
    expect_error(
        spongebob:::.longest_word(list("char in list", "char in list"))
        , regexp = msg
    )
})
