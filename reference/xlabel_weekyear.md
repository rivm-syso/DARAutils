# xlabel_weekyear

Given a character vector of ISOweeks, labels first ISOweek of a year
with the year-number and all others without the year-number, thus only
with the week- number.

## Usage

``` r
xlabel_weekyear(isoweeks)
```

## Arguments

- isoweeks:

  character vector with ISOweeks.

## Examples

``` r
isoweeks <- ISOweek(seq.Date(from = as.Date("2023-01-01"), to = as.Date("2023-02-01"), by = "week"))
xlabel_weekyear(isoweeks = isoweeks)
#> [1] "52\n2022" "1\n2023"  "2\n"      "3\n"      "4\n"     
```
