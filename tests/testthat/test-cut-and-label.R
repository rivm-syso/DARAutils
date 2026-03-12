test_that("cut_and_label has correct output for specific parameters", {
  df <- data.frame(
    x = rep(1:3),
    x_right_false = factor(c("1 t/m 2", "1 t/m 2", "3+"),
                           levels = c("<=0", "1 t/m 2", "3+")),
    x_right_true = factor(c("<=1", "2 t/m 2", "3+"),
                          levels = c("<=1", "2 t/m 2", "3+")),

    y = c(0.1, 0.5, 0.9),
    y_right_false = factor(c("<=0.1", "0.2 t/m 0.5", "0.6+"),
                           levels = c("<=0.1", "0.2 t/m 0.5", "0.6+")),
    y_right_true = factor(c("<=0.2", "0.3 t/m 0.6", "0.7+"),
                          levels = c("<=0.2", "0.3 t/m 0.6", "0.7+"))
  )

  expect_identical(
    cut_and_label(df$x, breaks = c(1, 3), right = FALSE),
    df$x_right_false
  )

  expect_identical(
    cut_and_label(df$x, breaks = c(1, 2), right = TRUE),
    df$x_right_true
  )

  expect_identical(
    cut_and_label(df$y, breaks = c(0.2, 0.6), right = FALSE, break_steps = 0.1),
    df$y_right_false
  )

  expect_identical(
    cut_and_label(df$y, breaks = c(0.2, 0.6), right = TRUE, break_steps = 0.1),
    df$y_right_true
  )

})



#with right = FALSE does not include right hand side of breaks
