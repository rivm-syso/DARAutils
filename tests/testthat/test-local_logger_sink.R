test_that("local_logger_sink changes appender from appender_console to appender_void", {

  expect_identical(
    get(log_appender(), envir = asNamespace("logger")),
    logger::appender_console
  )

  local_logger_sink()

  expect_identical(
    get(log_appender(), envir = asNamespace("logger")),
    appender_void
  )
})

test_that("local_logger_sink restores log_appender after parent function is executed", {

  la <- get(log_appender(), envir = asNamespace("logger"))

  get_local_la <- function() {
    local_logger_sink()
    log_info("hello")
    la <- get(log_appender(), envir = asNamespace("logger"))
    return(la)
  }

  # local_logger_sink only affects logging during the execution of test_fun
  la_local <- get_local_la()
  expect_identical(
    la_local,
    appender_void
  )

  # after execution of parent function logging is restored to la
  expect_identical(
    get(log_appender(), envir = asNamespace("logger")),
    la
  )
})
