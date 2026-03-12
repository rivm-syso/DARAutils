# Cut and label function

Cuts a vector into breaks and labels the levels.

## Usage

``` r
cut_and_label(
  x,
  breaks,
  right = TRUE,
  sep = " t/m ",
  extend_inf = TRUE,
  break_steps = 1
)
```

## Arguments

- x:

  An integer vector to be cut and labeled.

- breaks:

  Vector of labels.

- right:

  Logical, should right hand side of breaks be included in labels?

- sep:

  Character, the separator used for labels between break points.

- extend_inf:

  Logical, should breaks be extended to -Inf and Inf?

- break_steps:

  numeric, how exact should the break steps be (e.g. 1, .1, .01)

## Value

The rounded value of `x` with `digits` digits.

## Examples

``` r
cut_and_label(c(1, 5, 10), breaks = c(2, 5), right = TRUE, sep = "-", extend_inf = TRUE)
#> [1] <=2 3-5 6+ 
#> Levels: <=2 3-5 6+
cut_and_label(c(1, 5, 10), breaks = c(2, 10), right = FALSE, sep = " t/m ", extend_inf = FALSE)
#> [1] <NA>    2 t/m 9 <NA>   
#> Levels: 2 t/m 9
cut_and_label(c(.1, .2, .4, .7, .9), breaks = c(.3, 0.7), break_steps = .1)
#> [1] <=0.3       <=0.3       0.4 t/m 0.7 0.4 t/m 0.7 0.8+       
#> Levels: <=0.3 0.4 t/m 0.7 0.8+

dplyr::starwars |>
dplyr::mutate(height_category =
cut_and_label(height, breaks= c(100, 200), right = FALSE, sep = "-", extend_inf = TRUE))
#> # A tibble: 87 × 15
#>    name     height  mass hair_color skin_color eye_color birth_year sex   gender
#>    <chr>     <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#>  1 Luke Sk…    172    77 blond      fair       blue            19   male  mascu…
#>  2 C-3PO       167    75 NA         gold       yellow         112   none  mascu…
#>  3 R2-D2        96    32 NA         white, bl… red             33   none  mascu…
#>  4 Darth V…    202   136 none       white      yellow          41.9 male  mascu…
#>  5 Leia Or…    150    49 brown      light      brown           19   fema… femin…
#>  6 Owen La…    178   120 brown, gr… light      blue            52   male  mascu…
#>  7 Beru Wh…    165    75 brown      light      blue            47   fema… femin…
#>  8 R5-D4        97    32 NA         white, red red             NA   none  mascu…
#>  9 Biggs D…    183    84 black      light      brown           24   male  mascu…
#> 10 Obi-Wan…    182    77 auburn, w… fair       blue-gray       57   male  mascu…
#> # ℹ 77 more rows
#> # ℹ 6 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>, height_category <fct>
```
