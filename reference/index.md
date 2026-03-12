# Package index

## Date functions

Helper functions used for correct date formatting & calculations.

- [`ISOweek()`](ISOweek.md) : Converts a date to ISOweek format
  (yyyy-Wxx)
- [`xlabel_weekyear()`](xlabel_weekyear.md) : xlabel_weekyear
- [`join_date_sequence()`](join_date_sequence.md) : Executes join
  function 'join_f' to data frames x and y

## Logger functions

Helper functions used for clean log messages.

- [`formatter_cli()`](formatter_cli.md) : Custom formatter that serves
  as input to DARA log_formatter
- [`layout_generator_subject()`](layout_generator_subject.md) : Adds
  date, time and subject to logger message
- [`local_logger_sink()`](local_logger_sink.md) : Turn off logging for
  the duration of the parent function's execution and restore

## Other functions

Functions that don’t fit into a specific category.

- [`send_mail()`](send_mail.md) : Send mail
- [`upgrade_config()`](upgrade_config.md) **\[experimental\]** :
  Converts the old-style config file to the new multiple config files
- [`cut_and_label()`](cut_and_label.md) : Cut and label function
- [`import_rds_to_object()`](import_rds_to_object.md) : Import rds
  file(s) from a specified path
- [`inheriting_merge()`](inheriting_merge.md) : Union of a set of named
  lists/vectors in which the last occurrence for each entry is returned.
