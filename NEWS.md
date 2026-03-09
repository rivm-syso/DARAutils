# DARAutils v0.6.0
09-03-2026

### :sparkles: Added
- Deploy DARAutils on RIVM Syso Github
- README.md for GitHub (#79)

### :hammer_and_wrench: Changed

- Common mistake linters added and linted whole package (#66).
- Changed the CICD Rpackage setup. Now it first scans the known libpaths (including
the docker image), before installing missing packages.
This results in a faster CICD-pipeline runtime. (#90).
- Moved citation file to correct location.

### :bug: Fixed

- Remove unused imports (#80)

### :coffin: Deprecated


# DARAutils v0.5.0
11-06-2025

### :sparkles: Added
- Set code example install instruction build = FALSE
### :hammer_and_wrench: Changed

### :bug: Fixed
- Remove logger 0.3.0 from DESCRIPTION
### :coffin: Deprecated

# DARAutils v0.4.1
13-03-2025

### :sparkles: Added

### :hammer_and_wrench: Changed

### :bug: Fixed
- Missing man pages for `cut_and_label` function
### :coffin: Deprecated

# DARAutils v0.4.0
11-03-2025

### :sparkles: Added
- Floating point support to function `cut_and_label`
- Extra tests to function `cut_and_label` to test new functionality

### :hammer_and_wrench: Changed
- logger dependency back to >=0.3.0 (instead of fixed at ==0.3.0)

### :bug: Fixed

### :coffin: Deprecated

# DARAutils v0.3.0
10-01-2025

### :sparkles: Added

- Downgraded minimal pkgdown version to 2.0.7 (#48).

### :hammer_and_wrench: Changed

- Updated NEWS.md file to work with pkgdown (#49).

### :bug: Fixed

### :coffin: Deprecated


# DARAutils v0.2.0
11-12-2024

### :sparkles: Added

### :hammer_and_wrench: Changed

- License and README update (#45).

### :bug: Fixed

- Fix missing quote in gitlab-ci yml for pages step (#44).

### :coffin: Deprecated


# DARAutils v0.1.3
03-12-2024

### :sparkles: Added

- Added a pkgdown website + coverage (#40).

### :hammer_and_wrench: Changed

### :bug: Fixed

- Fix logger 0.3.0 dependency (#42).

### :coffin: Deprecated


# DARAutils v0.1.2
29-11-2024

### :sparkles: Added

- Added script `send_mail` that contains function `send_mail`.

- Added script `import_rds_to_object` that contains function `import_rds_to_object`.

### :hammer_and_wrench: Changed

### :bug: Fixed

### :coffin: Deprecated


##  V0.1.1 30-09-2024

### :sparkles: Added

- Added script `generic_processing` that contains functions `cut_and_label` and `inheriting_merge`.

- Added script `date_processing` that contains functions `ISOweek`, `join_date_sequence`, and `xlabel_weekyear`.

### :hammer_and_wrench: Changed

- Downgraded dependency on withr to 3.0.0, because of problems caused by the R OOD library still having the 3.0.0 version (#25).

- Edited script `logger`, as `local_logger_sink` function was added to this script

### :bug: Fixed

### :coffin: Deprecated


# DARAutils v0.1.0
03-09-2024

### :sparkles: Added

- Added function `local_logger_sink`, which helps with testing by locally capture the output of logger to a temp file.

- Added function `formatter_cli` and `layout_generator_subject`, which are custom functions for the logger.

- Added function `xlabel_weekyear`, which labels first ISOweek of a year with the year-number and all others without the year-number but only with the week-number.

- Added function `join_date_sequence`, which executes a dplyr join function to join date sequences.

- Added function `ISOweek`, which returns the year and the week a given date according to ISO 860.

- Added function `inheriting_merge`, which merges a set of named lists/vectors and the last occurrence for each entry is returned.

- Added function `cut_and_label`, which cuts a vector into breaks and labels the levels.

- Added magrittr's pipe operator to use in example of `cut_and_label`.

- Added function `upgrade_config`, which converts the old-style config file to the new multiple config files.


### :hammer_and_wrench: Changed

### :bug: Fixed

### :coffin: Deprecated
