#' Cut and label function
#'
#' @description Cuts a vector into breaks and labels the levels.
#'
#' @param x An integer vector to be cut and labeled.
#' @param breaks Vector of labels.
#' @param right Logical, should right hand side of breaks be included in labels?
#' @param sep Character, the separator used for labels between break points.
#' @param extend_inf Logical, should breaks be extended to -Inf and Inf?
#' @param break_steps numeric, how exact should the break steps be (e.g. 1, .1, .01)
#' @return The rounded value of \code{x} with \code{digits} digits.
#' @examples
#' cut_and_label(c(1, 5, 10), breaks = c(2, 5), right = TRUE, sep = "-", extend_inf = TRUE)
#' cut_and_label(c(1, 5, 10), breaks = c(2, 10), right = FALSE, sep = " t/m ", extend_inf = FALSE)
#' cut_and_label(c(.1, .2, .4, .7, .9), breaks = c(.3, 0.7), break_steps = .1)
#'
#'dplyr::starwars |>
#'dplyr::mutate(height_category =
#'cut_and_label(height, breaks= c(100, 200), right = FALSE, sep = "-", extend_inf = TRUE))
#' @export
cut_and_label <- function(x, breaks, right = TRUE, sep = " t/m ", extend_inf = TRUE, break_steps = 1) {
  if (extend_inf) {
    breaks_bound <- c(-Inf, breaks, Inf)
  } else {
    breaks_bound <- breaks
  }

  n <- length(breaks_bound) - 1
  if (right) {
    lbls <- str_c(breaks_bound[1:n] + break_steps, sep, breaks_bound[2:(n + 1)])
  } else {
    lbls <- str_c(breaks_bound[1:n], sep, breaks_bound[2:(n + 1)] - break_steps)
  }

  lbls <- lbls |>
    str_replace(sprintf("^-Inf%s", sep), "<=") |>
    str_replace(sprintf("%sInf$", sep), "+")
  cut(x, breaks = breaks_bound, right = right, labels = lbls)
}



#' Union of a set of named lists/vectors in which the last occurrence for each
#' entry is returned.
#'
#' @description Takes lists or vectors and returns the named
#'   union. If a named entry occurs more than once only the last entry is
#'   returned. Unnamed entries are never returned. This function can be useful
#'   when defining a set of default argument and a varying list of arguments
#'   that need to overwrite those defaults.
#'
#'   The object class of the first entry is used for the return value.
#'
#' @param ... Named lists/vectors.
#' @param call The calling function used for warning tracing. Default = parent.frame().
#'
#' @returns An object with the same class as the first input containing the
#'   inherited union of the inputs.
#'
#' @examples
#' default_args <- list(a = 1, b = "something")
#' overwriting_args <- list(a = 2, c = "foo")
#' overwriting_args2 <- list(a = 3, b = "else")
#'
#' inheriting_merge()
#' inheriting_merge(default_args)
#' inheriting_merge(default_args, overwriting_args)
#' inheriting_merge(default_args, overwriting_args, overwriting_args2)
#'
#' @export
inheriting_merge <- function(..., call = parent.frame()) {
  inputs <- list(...)
  if (any(map_lgl(inputs, is.null))) {
    arg_empty <- which(map_lgl(inputs, is.null))
    cli_warn(
      c("!" = "{qty(length(arg_empty))}Argument{?s} number {.val {arg_empty}}
        {qty(length(arg_empty))}{?is/are} empty and will be ignored!"),
      call = call
    )
    inputs <- inputs[-arg_empty]
  }

  if (length(inputs) == 0) {
    return(list())
  }

  if (any(map_lgl(inputs, ~ is.null(names(.x)) | any(names(.x) == "")))) {
    arg_missing_names <- which(map_lgl(inputs, ~ is.null(names(.x)) | any(names(.x) == "")))

    cli_warn(
      c(
        "!" = "{qty(length(arg_missing_names))}Argument{?s} number {.val {arg_missing_names}}
              had values with missing names!",
        "i" = "Name every value them after the merge, or removed them beforehand to get rid of this message."
      ),
      call = call
    )
  }
  merged_values <- list()
  for (input in inputs) {
    named_input <- input[names(input) != ""]
    merged_values[names(named_input)] <- named_input
  }
  result <- as(merged_values, class(inputs[[1]]))
  names(result) <- names(merged_values) # typecasting can remove names
  result
}
