test_that("local_logger_sink changes appender from appender_console to appender_void", {
  expect_equal(
    logger:::get_logger_definitions()$default$appender,
    logger::appender_console
  )

  local_logger_sink()

  expect_equal(
    logger:::get_logger_definitions()$default$appender,
    appender_void
  )
})

test_that("local_logger_sink restores log_appender after parent function is executed", {

  la <- logger:::get_logger_definitions()$default$appender

  get_local_la <- function() {
    local_logger_sink()
    log_info("hello")
    la <- logger:::get_logger_definitions()$default$appender
    return(la)
  }

  # local_logger_sink only affects logging during the execution of test_fun
  la_local <- get_local_la()
  expect_equal(
    la_local,
    appender_void
  )

  # after execution of parent function logging is restored to la
  expect_equal(
    logger:::get_logger_definitions()$default$appender,
    la
  )
})
