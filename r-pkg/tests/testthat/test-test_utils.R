context("test_utils")

### TEST UTILITY FUNCTION TESTS ###

test_that(".generate_word runs end-to-end successfully", {
    expect_true({
        spongebob:::.generate_word()
        TRUE
    })

    expect_true({
        spongebob:::.generate_word(36)
        TRUE
    })
})

test_that(".generate_word generates random-letter words as expected", {
    expect_true(is.character(spongebob:::.generate_word()))
    expect_true(length(spongebob:::.generate_word()) == 1)
    expect_true(nchar(spongebob:::.generate_word()) > 0)

    expect_true(is.character(spongebob:::.generate_word(36)))
    expect_true(length(spongebob:::.generate_word(36)) == 1)
    expect_true(nchar(spongebob:::.generate_word(36)) == 36)
})

test_that(".generate_sentence runs end-to-end successfully", {
    expect_true({
        spongebob:::.generate_sentence()
        TRUE
    })

    expect_true({
        spongebob:::.generate_sentence(36)
        TRUE
    })

    expect_true({
        spongebob:::.generate_sentence(c(2, 4, 8))
        TRUE
    })
})

test_that(".generate_sentence generates random-letter words as expected", {
    expect_true(is.character(spongebob:::.generate_sentence()))
    expect_true(length(spongebob:::.generate_sentence()) > 0)
    expect_true(all(nchar(spongebob:::.generate_sentence()) > 0))

    testSentence <- spongebob:::.generate_sentence(36)
    expect_true(is.character(testSentence))
    expect_true(length(testSentence) == 1)
    expect_true(length(unlist(strsplit(testSentence, " "))) == 1)
    expect_true(nchar(testSentence) == 36)

    testSentence <- spongebob:::.generate_sentence(c(2,4,8))
    expect_true(is.character(testSentence))
    expect_true(length(testSentence) == 1)
    expect_true(length(unlist(strsplit(testSentence, " "))) == 3)
    expect_true(all(nchar(unlist(strsplit(testSentence, " "))) == c(2,4,8)))
})
