test_that("local_logger_sink changes log level to `OFF`", {
  local_logger_sink()

  expect_identical(
    logger::log_threshold(),
    logger::OFF
  )
})

test_that("local_logger_sink restores log threshold after parent function is executed", {
  current_threshold <- logger::log_threshold()

  get_local_threshold <- function() {
    local_logger_sink()
    log_info("hello")
    local_threshold <- logger::log_threshold()
    return(local_threshold)
  }

  # local_logger_sink only affects logging during the execution of test_fun
  threshold_local <- get_local_threshold()
  expect_identical(
    threshold_local,
    logger::OFF
  )

  # after execution of parent function logging is restored to original threshold
  expect_identical(
    logger::log_threshold(),
    current_threshold
  )
})
