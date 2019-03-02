context("tospongebob")

### tospongebob TESTS ###

for (test in testList) {

    methodHandle <- eval(parse(text = paste0("spongebob:::", test[["method"]])))

    for (inputName in names(test[["input"]])) {
        test_that(sprintf("%s runs end-to-end-successfully for input %s"
                          , test[["method"]]
                          , inputName
                          ), {
            expect_true({
                do.call(what = methodHandle
                        , args = list(x = test[["input"]][[inputName]]))
                TRUE
            })
        })

        test_that(sprintf("tospongebob properly dispatches to %s", test[["method"]]), {

            expect_equal(
                object = {
                    set.seed(42)
                    tospongebob(test[["input"]][[inputName]])
                }
                , expected = {
                    set.seed(42)
                    do.call(what = methodHandle
                            , args = list(x = test[["input"]][[inputName]]))
                }
            )
        })
    } # /for input
} # /for test

test_that("tospongebob.character errors for non-character inputs", {
    msg <- "not a character vector"
    expect_error(spongebob:::tospongebob.character(123), regexp = msg)
    expect_error(spongebob:::tospongebob.character(c(TRUE, FALSE)), regexp = msg)
    expect_error(
        spongebob:::tospongebob.character(list("char in list", "char in list"))
        , regexp = msg
    )
})
