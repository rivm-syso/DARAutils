#' Converts the old-style config file to the new multiple config files
#'
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' A function to upgrade from the singular old style config file to
#' the new multi-file config files. The new config files enables the use
#' functions such as pipeline_init(),  pipeline_run() and
#' pipeline_import_for().
#'
#'
#' @param config_file_old String. Location of the old config file.
#' @param config_dir_new String. Location of the new config folder.
#'
#' @return NULL
#' @export
#'
#' @examples
#' \dontrun{
#' upgrade_config()
#' }
#'
upgrade_config <- function(config_file_old = "config/config.yaml", config_dir_new = "config") {
  filter_unique_elements <- function(x) {
    x[unique(names(x))]
  }

  check_string(config_file_old)
  check_string(config_dir_new)

  if (!file_exists(config_file_old)) {
    cli_abort("Can't open the config file. {.arg config_file_old} = {.path {config_file_old}} does not exist!")
  }

  config_old <- read_yaml(config_file_old)


  # file_paths.yaml
  check_list(config_old$outputs)
  check_string(config_old$outputs$dir_outputs)
  check_string(config_old$outputs$dir_scripts)
  config_paths <- config_old$outputs[c("dir_outputs", "dir_scripts")]


  # object_definitions.yaml
  check_list(config_old$outputs$objects)
  config_definitions_defaults <- list(
    "__defaults__" =
      list(
        skip_cache = FALSE,
        tag = "no_tag",
        type = "object",
        output_formats = NULL,
        output_arguments = NULL,
        output_formats_custom = NULL
      )
  )
  config_definitions_objects <- config_old$outputs$objects |>
    map(\(x) {
      c(
        list(type = "object"),
        x[intersect(names(x), c("tag", "skip_cache", "output_formats", "output_arguments",
                                "output_arguments", "output_formats_custom"))]
      )
    })

  config_definitions_data <- config_old$outputs$objects |>
    map(\(x) {
      x$depends_on[["data"]] |>
        map(\(y) list(type = "data", dir_input = y))
    }) |>
    unname() |>
    list_flatten() |>
    filter_unique_elements()

  config_definitions_other <- config_old$outputs$objects |>
    map(\(x) {
      x$depends_on[["other"]] |>
        map(\(y) list(type = "other", dir_input = y))
    }) |>
    unname() |>
    list_flatten() |>
    filter_unique_elements()

  config_definitions <- c(
    config_definitions_defaults,
    config_definitions_objects,
    config_definitions_data,
    config_definitions_other
  )

  # object_relations.yaml
  config_relations <- config_old$outputs$objects |>
    map(\(x) {
      c(
        names(x$depends_on[["data"]]),
        names(x$depends_on[["other"]]),
        x$depends_on[["object"]]
      ) |>
        as.list()
    }) |>
    compact() # removes empty objects (no dependencies)

  # writing and opening
  config_dir_base <- path(config_dir_new, "base")
  file_paths <- path(config_dir_base, "file_paths.yaml")
  file_definitions <- path(config_dir_base, "object_definitions.yaml")
  file_relations <- path(config_dir_base, "object_relations.yaml")
  if (any(file_exists(c(file_paths, file_definitions, file_relations)))) {
    cli_abort(c(
      "!" = "At least 1 new-style pipeline yaml was found!",
      "i" = "These need to be created and can't be present yet:
            {.path {c(file_paths, file_definitions, file_relations)}}"
    ))
  }


  dir_create(config_dir_base)
  write_yaml(config_paths, file_paths)
  write_yaml(config_definitions, file_definitions)
  write_yaml(config_relations, file_relations)

  log_info("Migrated old-style config to new style config to {.path {c(file_paths, file_definitions, file_relations)}}")
  log_info("Note that {.emph not all config fields} may have migrated to the new files!")

  if (interactive()) {
    documentOpen(file_paths)
    documentOpen(file_definitions)
    documentOpen(file_relations)
  }

  invisible(NULL)
}
