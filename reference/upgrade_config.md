# Converts the old-style config file to the new multiple config files

**\[experimental\]**

A function to upgrade from the singular old style config file to the new
multi-file config files. The new config files enables the use functions
such as pipeline_init(), pipeline_run() and pipeline_import_for().

## Usage

``` r
upgrade_config(
  config_file_old = "config/config.yaml",
  config_dir_new = "config"
)
```

## Arguments

- config_file_old:

  String. Location of the old config file.

- config_dir_new:

  String. Location of the new config folder.

## Examples

``` r
if (FALSE) { # \dontrun{
upgrade_config()
} # }
```
