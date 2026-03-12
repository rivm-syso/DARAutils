test_that("join_date_sequence joins dates correctly ", {
  x <- data.frame(dates = seq.Date(from = as.Date("2020-01-01"), to = as.Date("2022-07-01"), by = "6 months"))
  y <- tibble::tribble(
    ~Datum_peiling, ~Populatie, ~Land,
    as.Date("2020-01-01"), 17407585, "Nederland",
    as.Date("2021-01-01"), 17475415, "Nederland",
    as.Date("2022-01-01"), 17590672, "Nederland"
  )
  output_correct_dates_join <- tibble::tribble(
    ~dates, ~Datum_peiling, ~Populatie, ~Land,
    as.Date("2020-01-01"), as.Date("2020-01-01"), 17407585, "Nederland",
    as.Date("2020-07-01"), as.Date("2020-01-01"), 17407585, "Nederland",
    as.Date("2021-01-01"), as.Date("2021-01-01"), 17475415, "Nederland",
    as.Date("2021-07-01"), as.Date("2021-01-01"), 17475415, "Nederland",
    as.Date("2022-01-01"), as.Date("2022-01-01"), 17590672, "Nederland",
    as.Date("2022-07-01"), as.Date("2022-01-01"), 17590672, "Nederland"
  ) |>
    as.data.frame()
  expect_identical(
    join_date_sequence(x = x, y = y, by = NULL, date_x = dates, date_y = Datum_peiling, join_f = left_join) |>
      as.data.frame(),
    output_correct_dates_join
  )
})
