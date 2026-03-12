# Package index

## Date functions

Helper functions used for correct date formatting & calculations.

- [`ISOweek()`](https://rivm-syso.github.io/DARAutils/reference/ISOweek.md)
  : Converts a date to ISOweek format (yyyy-Wxx)
- [`xlabel_weekyear()`](https://rivm-syso.github.io/DARAutils/reference/xlabel_weekyear.md)
  : xlabel_weekyear
- [`join_date_sequence()`](https://rivm-syso.github.io/DARAutils/reference/join_date_sequence.md)
  : Executes join function 'join_f' to data frames x and y

## Logger functions

Helper functions used for clean log messages.

- [`formatter_cli()`](https://rivm-syso.github.io/DARAutils/reference/formatter_cli.md)
  : Custom formatter that serves as input to DARA log_formatter
- [`layout_generator_subject()`](https://rivm-syso.github.io/DARAutils/reference/layout_generator_subject.md)
  : Adds date, time and subject to logger message
- [`local_logger_sink()`](https://rivm-syso.github.io/DARAutils/reference/local_logger_sink.md)
  : Turn off logging for the duration of the parent function's execution
  and restore

## Other functions

Functions that don’t fit into a specific category.

- [`send_mail()`](https://rivm-syso.github.io/DARAutils/reference/send_mail.md)
  : Send mail
- [`upgrade_config()`](https://rivm-syso.github.io/DARAutils/reference/upgrade_config.md)
  **\[experimental\]** : Converts the old-style config file to the new
  multiple config files
- [`cut_and_label()`](https://rivm-syso.github.io/DARAutils/reference/cut_and_label.md)
  : Cut and label function
- [`import_rds_to_object()`](https://rivm-syso.github.io/DARAutils/reference/import_rds_to_object.md)
  : Import rds file(s) from a specified path
- [`inheriting_merge()`](https://rivm-syso.github.io/DARAutils/reference/inheriting_merge.md)
  : Union of a set of named lists/vectors in which the last occurrence
  for each entry is returned.
