context("spongebobsay")

test_that(".make_ascii_maker runs end-to-end successfully", {
    expect_true({
        spongebob:::.make_ascii_maker(left = "."
                          , right = "."
                          , top = "."
                          , bottom = "."
                          , tail = ".."
        )
        TRUE
    })
})

test_that("spongebobsay runs end-to-end successfully", {
    expect_true({
        cat("\n")
        spongebobsay("spongebob says jump")
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobsay("spongebob says jump", print = FALSE)
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobsay(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobsay(paste(sample(
            letters
            , size = spongebob:::.MAX_ALLOWED_WIDTH
            , replace = TRUE
        ), collapse = ""))
        TRUE
    })
})

test_that("spongebobthink runs end-to-end successfully", {
    expect_true({
        cat("\n")
        spongebobthink("are they jumping?")
        TRUE
    })
    expect_true({
        spongebobthink("are they jumping?", print = FALSE)
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobthink(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobthink(paste(sample(
            letters
            , size = spongebob:::.MAX_ALLOWED_WIDTH
            , replace = TRUE
        ), collapse = ""))
        TRUE
    })
})

test_that("spongebobwhisper runs end-to-end successfully", {
    expect_true({
        cat("\n")
        spongebobwhisper("please jump")
        TRUE
    })
    expect_true({
        spongebobwhisper("please jump", print = FALSE)
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobwhisper(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
        cat("\n")
        spongebobwhisper(paste(sample(
            letters
            , size = spongebob:::.MAX_ALLOWED_WIDTH
            , replace = TRUE
        ), collapse = ""))
        TRUE
    })
})

test_that("spongebobsay errors for non-string inputs", {
    msg <- "not a length-1 character string"
    expect_error(spongebobsay(123), regexp = msg)
    expect_error(spongebobsay(c(TRUE, FALSE)), regexp = msg)
    expect_error(spongebobsay(c("hello", "i'm a vector")), regexp = msg)
    expect_error(
        spongebobsay(list("char in list", "char in list"))
        , regexp = msg
    )
})

test_that("spongebobsay errors for bad print flag", {
    msg <- "not a length-1 logical"
    expect_error(spongebobsay("I'm correct", "tricked you"), regexp = msg)
    expect_error(spongebobsay("still correct", c(TRUE, TRUE)))
})

test_that("spongebobsay errors for words longer than allowed symbol length", {
    msg <- "does not support input with words longer than"
    expect_error(
        spongebobthink(paste(sample(
                letters
                , size = spongebob:::.MAX_ALLOWED_WIDTH + 1
                , replace = TRUE
            ), collapse = ""))
        , regexp = msg
    )
})

test_that("ascii_spongebob runs end-to-end successfully", {
    expect_true({
        cat("\n")
        ascii_spongebob()
        TRUE
    })
    expect_true({
        ascii_spongebob(print = FALSE)
        TRUE
    })
})

test_that("ascii_spongebob errors for bad print flag", {
    msg <- "not a length-1 logical"
    expect_error(ascii_spongebob("tricked you again"), regexp = msg)
    expect_error(ascii_spongebob(c(TRUE, TRUE)))
})
