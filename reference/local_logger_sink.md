# Turn off logging for the duration of the parent function's execution and restore

This function is used in many test functions of DARA packages, because
logging can clutter the output of test runs in the Build tab.

## Usage

``` r
local_logger_sink()
```
