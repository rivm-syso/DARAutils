# Import rds file(s) from a specified path

Import rds files from a specified path and optionally a date. By
default, rds files from today are imported.

## Usage

``` r
import_rds_to_object(
  path,
  date = today(),
  skip_modification_check = FALSE,
  pattern = ".",
  recursive = FALSE
)
```

## Arguments

- path:

  Path where rds files are located.

- date:

  Date that rds files should contain in their file name.

- skip_modification_check:

  Skip using a date to find a file. Default: FALSE.

- pattern:

  Optional character string defining a pattern in the filename.

- recursive:

  Logical. Should the listing recurse into directories?

## Examples

``` r
if (FALSE) { # \dontrun{
import_rds_to_object(path = "./example", date = as.Date("2000-01-01"))
import_rds_to_object(path = "./example", skip_modification_check = TRUE)
} # }
```
