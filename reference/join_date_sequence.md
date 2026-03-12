# Executes join function 'join_f' to data frames x and y

Executes join function 'join_f' to data frames x and y, where y is the
population data. Y has a 'date_y' variable that specifies from which
moment the population is valid

## Usage

``` r
join_date_sequence(x, y, by, date_x, date_y, join_f = left_join, ...)
```

## Arguments

- x:

  Data.frame / tibble, data to be joined.

- y:

  Data.frame / tibble, population data.

- by:

  Character, extra column to join x and y (besides date columns), e.g.
  "Veiligheidsregio". NULL if there is no other column.

- date_x:

  Date vector, variable in x.

- date_y:

  Date vector, variable in y (population). Becomes 'from' date.

- join_f:

  Function, one of: left_join, right_join, inner_join, full_join.

- ...:

  Optional.

## Value

Joint data.frame of `x` and `y`. Attention: column `date_y` is added.

## Examples

``` r
x <- data.frame(
  dates = seq.Date(
    from = as.Date("2020-01-01"),
    to = as.Date("2022-07-01"),
    by = "6 months"
  )
)
y <- tibble::tribble(
  ~Date_poll, ~Population, ~Country,
  as.Date("2020-01-01"), 17407585, "Netherlands",
  as.Date("2021-01-01"), 17475415, "Netherlands",
  as.Date("2022-01-01"), 17590672, "Netherlands"
)
join_date_sequence(x = x, y = y, by = NULL, date_x = dates, date_y = Date_poll)
#>        dates  Date_poll Population     Country
#> 1 2020-01-01 2020-01-01   17407585 Netherlands
#> 2 2020-07-01 2020-01-01   17407585 Netherlands
#> 3 2021-01-01 2021-01-01   17475415 Netherlands
#> 4 2021-07-01 2021-01-01   17475415 Netherlands
#> 5 2022-01-01 2022-01-01   17590672 Netherlands
#> 6 2022-07-01 2022-01-01   17590672 Netherlands
```
