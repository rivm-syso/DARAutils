# Custom formatter that serves as input to DARA log_formatter

Custom formatter that serves as input to DARA log_formatter

## Usage

``` r
formatter_cli(
  ...,
  .logcall = sys.call(),
  .topcall = sys.call(-1),
  .topenv = parent.frame()
)
```

## Arguments

- ...:

  argument to msg_linesep

- .logcall:

  NULL or error

- .topcall:

  NULL or error

- .topenv:

  NULL or error
