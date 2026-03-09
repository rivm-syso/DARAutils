test_that("no inheritance", {
  default_args <- list(a = 1, b = "something")
  expect_identical(
    inheriting_merge(),
    list()
  )
  expect_identical(
    inheriting_merge(default_args),
    default_args
  )
})

test_that("Inheritance", {
  default_args <- list(a = 1, b = "something")
  overwriting_args <- list(a = 2, c = "foo")
  overwriting_args2 <- list(a = 3, b = "else")

  expect_identical(
    inheriting_merge(default_args, overwriting_args),
    list(a = 2, b = "something", c = "foo")
  )

  expect_identical(
    inheriting_merge(default_args, overwriting_args, overwriting_args2),
    list(a = 3, b = "else", c = "foo")
  )
})

test_that("dropped names", {
  default_args <- list(123123, a = 1, b = "something")
  overwriting_args <- list(2, "foo")
  expect_warning(
    expect_identical(
      inheriting_merge(default_args),
      list(a = 1, b = "something")
    ),
    "had values with missing names!"
  )

  expect_warning(
    expect_identical(
      inheriting_merge(default_args, overwriting_args),
      list(a = 1, b = "something")
    ),
    "had values with missing names!"
  )
})


test_that("mixed classes", {
  args_list <- list(a = 1, b = "something")
  args_char <- c(a = "2", b = "else")

  expect_type(
    inheriting_merge(args_list, args_char),
    "list"
  )
  expect_type(
    inheriting_merge(args_char, args_list),
    "character"
  )
})
