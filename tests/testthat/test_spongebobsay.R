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
        spongebobsay("spongebob says jump")
        TRUE
    })
    expect_true({
        spongebobsay(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
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
        spongebobthink("are they jumping?")
        TRUE
    })
    expect_true({
        spongebobthink(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
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
        spongebobwhisper("please jump")
        TRUE
    })
    expect_true({
        spongebobwhisper(
            "i really hope that this test passes \
            or else somebody is going to have to fix it"
        )
        TRUE
    })
    expect_true({
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
