# DARAutils
![coverage](https://raw.githubusercontent.com/rivm-syso/DARAutils/gh-pages/badges/coverage.svg)

## Useful generic functions that can be used in DARApipelines

## Overview
DARAutils (part of [DARAtools](https://gitlab.rivm.nl/dara/DARAtools)) is an R package 
that offers generic function that could be useful in DARA pipelines.

## Installation and updating

### From RIVM GitLab

#### Most recent version

To install DARAutils, first install the graph package by running:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("graph")
```

You can now download the latest version of DARAutils via the internal Gitlab environment using the remotes package:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_gitlab("dara/DARAutils@main", host = "https://gitlab.rivm.nl", build = FALSE)
```

Please visit the [Wiki](https://gitlab.rivm.nl/dara/wiki/-/wikis/DARAtools) to find instructions on how to install older versions of DARAutils.

#### Development version

``` r
remotes::install_gitlab("dara/DARAutils@develop", host = "https://gitlab.rivm.nl", build = FALSE)
```

### From RIVM-syso GitHub

*TODO add installation via Github*

### From CRAN

*TODO add installation via CRAN*

## Usage

`r library(DARAutils)` will load the DARAutils package, part of the DARAtools framework.
The other packages within [DARAtools](https://gitlab.rivm.nl/dara/DARAtools) are:

-   [DARAgit](https://gitlab.rivm.nl/dara/DARAgit), for git functionality.
-   [DARAvis](https://gitlab.rivm.nl/dara/DARAvis), for data visualisation in RIVM-house style.
-   [DARAgeo](https://gitlab.rivm.nl/dara/DARAgeo), for loading geographical data.
-   [DARApipeline](https://gitlab.rivm.nl/dara/DARApipeline), for running an EPI data pipeline.

## Getting help

For detailed documentation, use:

``` r
# The function cut_and_label() is used here as an example.
# Please replace it with the specific function for which you want to see documentation.
?cut_and_label
```

First point of contact for questions: DARAteam ([dara-team-list\@rivm.nl](mailto:dara-team-list@rivm.nl){.email}).

Please report an DARAutils issue at [GitLab issues](https://gitlab.rivm.nl/dara/DARAutils/-/issues).

## Authors and acknowledgment

This R package was created by the DARA team (RIVM/CiB/EPI in department DIS).

## License

The code can be re-used under license [EUPL v.1.2](https://eupl.eu/1.2/en/).

