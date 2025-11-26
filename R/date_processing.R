#' Converts a date to ISOweek format (yyyy-Wxx)
#'
#' @description
#' This function returns the year and the week of the year of a given date
#' according to ISO 8601.
#' Mimics the
#'   [ISOweek](https://www.rdocumentation.org/packages/ISOweek/versions/0.6-2/topics/ISOweek)
#'   function from the
#'   [ISOweek package](https://www.rdocumentation.org/packages/ISOweek), but
#'   uses lubridate functions internally.
#'
#' @param date date or datetime: the date (or vector of dates) that you want to convert to ISOweek.
#'
#' @return A character in the form yyyy-Wxx, e.g. "2022-W52" "2021-W52" "2020-W12".
#' @export
#' @examples
#' library(ggplot2)
#' economics |>
#' dplyr::mutate(ISOweek = date |> ISOweek())
#'
#'
ISOweek <- function(date) {
  check_date_or_datetime(date)

  dat_input <- tibble(date = date)
  dim_isoweek <- dat_input |>
    distinct(date) |>
    mutate(isoweek = map_chr(date, ~ sprintf("%i-W%02i", isoyear(.x), isoweek(.x))))
  dat_input |>
    left_join(dim_isoweek, by = "date") |>
    pull(isoweek)
}

#' Executes join function 'join_f' to data frames x and y
#'
#' @description Executes join function 'join_f' to data frames x and y, where y is the population data.
#' Y has a 'date_y' variable that specifies from which moment the population is valid
#'
#' @param x Data.frame / tibble, data to be joined.
#' @param y Data.frame / tibble, population data.
#' @param by Character, extra column to join x and y (besides date columns), e.g. "Veiligheidsregio".
#' NULL if there is no other column.
#' @param date_x Date vector, variable in x.
#' @param date_y Date vector, variable in y (population). Becomes 'from' date.
#' @param join_f Function, one of: left_join, right_join, inner_join, full_join.
#' @param ... Optional.
#' @return Joint data.frame of \code{x} and \code{y}. Attention: column \code{date_y} is added.
#'
#' @examples
#' x <- data.frame(
#'   dates = seq.Date(
#'     from = as.Date("2020-01-01"),
#'     to = as.Date("2022-07-01"),
#'     by = "6 months"
#'   )
#' )
#' y <- tibble::tribble(
#'   ~Date_poll, ~Population, ~Country,
#'   as.Date("2020-01-01"), 17407585, "Netherlands",
#'   as.Date("2021-01-01"), 17475415, "Netherlands",
#'   as.Date("2022-01-01"), 17590672, "Netherlands"
#' )
#' join_date_sequence(x = x, y = y, by = NULL, date_x = dates, date_y = Date_poll)
#'
#' @export
join_date_sequence <- function(x, y, by, date_x, date_y, join_f = left_join, ...) {
  date_x <- enquo(date_x)
  date_y <- enquo(date_y)

  date_group_starts <- unique(pull(y, !!date_y))
  # Add date group column with reference date ("from" date) as factor-level
  x_dgroup <- x |>
    mutate(date_group = cut(
      !!date_x,
      breaks = c(date_group_starts, today() + years(100)),
      labels = sort(unique(date_group_starts))
    ))

  # Mutate dates from y to a factor, alphabetically (thus as.factor) matching x
  y_dgroep <- y |>
    mutate(date_group = as.factor(!!date_y))
  # join x and y with join function and delete date_group column
  # Pay attention:
  x_dgroup |>
    join_f(y_dgroep, by = c(by, "date_group"), ...) |>
    select(-date_group)
}

#' xlabel_weekyear
#'
#' @description
#' Given a character vector of ISOweeks, labels first ISOweek of a year with the
#' year-number and all others without the year-number, thus only with the week-
#' number.
#'
#' @param isoweeks character vector with ISOweeks.
#'
#' @examples
#' isoweeks <- ISOweek(seq.Date(from = as.Date("2023-01-01"), to = as.Date("2023-02-01"), by = "week"))
#' xlabel_weekyear(isoweeks = isoweeks)
#'
#' @export
xlabel_weekyear <- function(isoweeks) {
  # Dataframe of all isoweeks, weeknumbers, year and index
  df <- tibble(
    isowk = isoweeks,
    wk.nr = isowk |> str_extract("[0-9]{2}$") |> as.numeric(),
    yr = isowk |> str_extract("[0-9]{4}")
  ) |>
    mutate(index = seq_len(n()))
  # Indices that have to be labeled with year-number (first per year)
  df.lbl <- df |>
    rename(yr.lbl = yr) |>
    group_by(yr.lbl) |>
    summarise(index = min(index))
  # Create actual labels
  left_join(df, df.lbl, by = "index") |>
    replace_na(list(yr.lbl = "")) |>
    mutate(lbl = str_c(wk.nr, yr.lbl, sep = "\n")) |>
    pull(lbl)
}
