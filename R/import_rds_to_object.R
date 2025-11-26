#' Import rds file(s) from a specified path
#'
#' @description Import rds files from a specified path and optionally a date.
#' By default, rds files from today are imported.
#'
#' @param path Path where rds files are located.
#' @param date Date that rds files should contain in their file name.
#' @param skip_modification_check Skip using a date to find a file. Default: FALSE.
#' @param pattern Optional character string defining a pattern in the filename.
#' @param recursive Logical. Should the listing recurse into directories?
#'
#' @examples
#' \dontrun{
#' import_rds_to_object(path = "./example", date = as.Date("2000-01-01"))
#' import_rds_to_object(path = "./example", skip_modification_check = TRUE)
#' }
#'
#' @export
#'
#'
#'
import_rds_to_object <- function(path, date = today(),
                                 skip_modification_check = FALSE,
                                 pattern = ".",
                                 recursive = FALSE) {
  # List all rds files in path
  files <- path %>%
    list.files(
      full.names = TRUE,
      pattern = "rds",
      recursive = recursive
    ) %>%
    str_subset(pattern = pattern)
  
  # If length is 0, give error and stop script
  if (length(files) == 0) {
    cli_abort("There are no rds files of today in {.val {path}}.
                   Run the corresponding masterscript again")
  }
  
  # If there are files, check whether all 'file modified times' are of today*.
  # If not, give error.
  # * For rds-files that are only made once per week, it is checked whether the files
  #   are not older than a week (date = today()-6)
  # Cause: cleaning script didn't run
  if (!skip_modification_check) {
    files_old_mtime <- files[file.mtime(files) %>% as.Date() < date]
    if (length(files_old_mtime) > 0) {
      cli_abort(
        "These rds files in {.path {path}} are not from {.val {date %>% format('%Y-%m-%d')}},
        {.val {files_old_mtime}}. Run the corresponding masterscript again."
      )
    }
  }
  
  # Loop over files
  files %>%
    walk(
      # Import rds
      .f = ~ readRDS(file = .x) %>%
        # and assign output to filename without rds
        # This object comes in the Global Environment
        assign(
          x = .x %>% basename() %>% str_remove(pattern = "\\.rds"),
          envir = .GlobalEnv
        )
    )
}
