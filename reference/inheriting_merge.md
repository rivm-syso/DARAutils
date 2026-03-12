# Union of a set of named lists/vectors in which the last occurrence for each entry is returned.

Takes lists or vectors and returns the named union. If a named entry
occurs more than once only the last entry is returned. Unnamed entries
are never returned. This function can be useful when defining a set of
default argument and a varying list of arguments that need to overwrite
those defaults.

The object class of the first entry is used for the return value.

## Usage

``` r
inheriting_merge(..., call = parent.frame())
```

## Arguments

- ...:

  Named lists/vectors.

- call:

  The calling function used for warning tracing. Default =
  parent.frame().

## Value

An object with the same class as the first input containing the
inherited union of the inputs.

## Examples

``` r
default_args <- list(a = 1, b = "something")
overwriting_args <- list(a = 2, c = "foo")
overwriting_args2 <- list(a = 3, b = "else")

inheriting_merge()
#> list()
inheriting_merge(default_args)
#> $a
#> [1] 1
#> 
#> $b
#> [1] "something"
#> 
inheriting_merge(default_args, overwriting_args)
#> $a
#> [1] 2
#> 
#> $b
#> [1] "something"
#> 
#> $c
#> [1] "foo"
#> 
inheriting_merge(default_args, overwriting_args, overwriting_args2)
#> $a
#> [1] 3
#> 
#> $b
#> [1] "else"
#> 
#> $c
#> [1] "foo"
#> 
```
