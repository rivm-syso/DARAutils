test_that("xlabel_weekyears correctly shows labels, test 1 ", {
  output_correct_xlabel_weekyear_1 <- c("52\n2022", "1\n2023", "2\n")
  expect_equal(
    xlabel_weekyear(isoweeks = c("2022-W52", "2023-W01", "2023-W02")),
    output_correct_xlabel_weekyear_1
  )
})


test_that("xlabel_weekyears correctly shows labels, test 2 ", {
  output_correct_xlabel_weekyear_2 <- c("51\n2022", "52\n", "1\n2023", "2\n")
  expect_equal(
    xlabel_weekyear(isoweeks = c("2022-W51", "2022-W52", "2023-W01", "2023-W02")),
    output_correct_xlabel_weekyear_2
  )
})
