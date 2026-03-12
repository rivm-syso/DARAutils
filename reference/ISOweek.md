# Converts a date to ISOweek format (yyyy-Wxx)

This function returns the year and the week of the year of a given date
according to ISO 8601. Mimics the
[ISOweek](https://www.rdocumentation.org/packages/ISOweek/versions/0.6-2/topics/ISOweek)
function from the [ISOweek
package](https://www.rdocumentation.org/packages/ISOweek), but uses
lubridate functions internally.

## Usage

``` r
ISOweek(date)
```

## Arguments

- date:

  date or datetime: the date (or vector of dates) that you want to
  convert to ISOweek.

## Value

A character in the form yyyy-Wxx, e.g. "2022-W52" "2021-W52" "2020-W12".

## Examples

``` r
library(ggplot2)
economics |>
dplyr::mutate(ISOweek = date |> ISOweek())
#> # A tibble: 574 × 7
#>    date         pce    pop psavert uempmed unemploy ISOweek 
#>    <date>     <dbl>  <dbl>   <dbl>   <dbl>    <dbl> <chr>   
#>  1 1967-07-01  507. 198712    12.6     4.5     2944 1967-W26
#>  2 1967-08-01  510. 198911    12.6     4.7     2945 1967-W31
#>  3 1967-09-01  516. 199113    11.9     4.6     2958 1967-W35
#>  4 1967-10-01  512. 199311    12.9     4.9     3143 1967-W39
#>  5 1967-11-01  517. 199498    12.8     4.7     3066 1967-W44
#>  6 1967-12-01  525. 199657    11.8     4.8     3018 1967-W48
#>  7 1968-01-01  531. 199808    11.7     5.1     2878 1968-W01
#>  8 1968-02-01  534. 199920    12.3     4.5     3001 1968-W05
#>  9 1968-03-01  544. 200056    11.7     4.1     2877 1968-W09
#> 10 1968-04-01  544  200208    12.3     4.6     2709 1968-W14
#> # ℹ 564 more rows

```
