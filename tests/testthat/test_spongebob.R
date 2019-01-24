context("tospongebob")

test_that("tospongebob runs end-to-end successfully", {
    expect_true({
        tospongebob("tospongebob runs end-to-end successfully")
        TRUE
    })
    expect_true({
        tospongebob(c(
            "i really hope that this test passes",
            "or else somebody is going to have to fix it"
        ))
        TRUE
    })
})

test_that("tospongebob errors for non-character inputs", {
    msg <- "not a character vector"
    expect_error(tospongebob(123), regexp = msg)
    expect_error(tospongebob(c(TRUE, FALSE)), regexp = msg)
    expect_error(
        tospongebob(list("char in list", "char in list"))
        , regexp = msg
    )
})
