formatter_cli <- structure(
  #' Custom formatter that serves as input to DARA log_formatter
  #'
  #' @param ... argument to msg_linesep
  #' @param .logcall NULL or error
  #' @param .topcall NULL or error
  #' @param .topenv NULL or error
  #'
  #' @return NULL
  #' @export
  function(..., .logcall = sys.call(), .topcall = sys.call(-1), .topenv = parent.frame()) {
    msg_linesep <- paste(unlist(list(...)), collapse = "\n")
    tryCatch(
      {
        msg_formatted <- format_inline(msg_linesep, .envir = .topenv)
      },
      error = function(x) {
        log_warn("Logger message parsing failed!")
        log_warn("Parser error message: {x$message}")
        log_warn("Falling back to simple paste formatter")
        msg_formatted <- msg_linesep
      }
    )

    msg_formatted
  },
  generator = quote(formatter_cli())
)

#' Adds date, time and subject to logger message
#'
#' @param subject string, subject of logger
#'
#' @return NULL
#' @export
layout_generator_subject <- function(subject) {
  format_string <- '{level} [{format(time, "%Y-%m-%d %H:%M:%S")}] [{subject}] {msg}'
  structure(function(level, msg, namespace = NA_character_,
                     .logcall = sys.call(), .topcall = sys.call(-1), .topenv = parent.frame()) {
    if (!inherits(level, "loglevel")) {
      stop("Invalid log level, see ?log_levels")
    }

    paste0(attr(level, "level"), " [", format_string(Sys.time(), "%Y-%m-%d %H:%M:%S"), "] [", subject, "] ", msg)
  }, generator = deparse(match.call()))
}

#' Turn off logging for the duration of the parent function's execution and restore
#'
#' This function is used in many test functions of DARA packages, because logging
#' can clutter the output of test runs in the Build tab.
#' @return NULL
#' @export
local_logger_sink <- function() {
  check_installed("withr")

  # save current log_appender function in object 'la'
  la <- get(log_appender(), envir = asNamespace("logger"))

  # do not deliver the log record to anywhere
  log_appender(appender_void)

  # when the parent function has finished executing, restore log_appender to 'la'
  withr::defer_parent(log_appender(la))
}
