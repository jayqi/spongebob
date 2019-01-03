context("tospongebob")

test_that("tospongebob runs end-to-end successfully", {
    expect_true({
        tospongebob("tospongebob runs end-to-end successfully")
        tospongebob(c(
            "i really hope that this test passes",
            "or else somebody is going to have to fix it"
        ))
        TRUE
    })
})
