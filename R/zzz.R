.onLoad <- function(libname, pkgname) {
  # Overwrite the formatter to a custom formatter (for global namespace, i.e.
  # anytime logger functions get used)
  log_formatter(formatter = formatter_cli, index = 1)
}
