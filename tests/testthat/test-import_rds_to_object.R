test_that("import rds to object works", {

  x <- "test_rds"

  dir.create(test_path("outputs"), showWarnings = FALSE)
  saveRDS(x, test_path("outputs/test_rds.rds"))

  rm(list = "x")

  import_rds_to_object(test_path("outputs"))

  expect_true(exists("test_rds"))

  file.remove(test_path("outputs/test_rds.rds"))
  unlink(test_path("outputs"), recursive = TRUE)

})

test_that("multiple rds files in output", {

  x <- "test1_rds"

  y <- "test2_rds"

  dir.create(test_path("outputs"), showWarnings = FALSE)
  saveRDS(x, test_path("outputs/test1_rds.rds"))
  saveRDS(y, test_path("outputs/test2_rds.rds"))

  rm(list = c("x", "y"))

  import_rds_to_object(test_path("outputs"))

  expect_true(exists("test1_rds") && exists("test2_rds"))

  file.remove(test_path("outputs/test1_rds.rds"))
  file.remove(test_path("outputs/test2_rds.rds"))
  unlink(test_path("outputs"), recursive = TRUE)


})

test_that("modification FALSE and ", {

  x <- "test_rds"

  dir.create(test_path("outputs"), showWarnings = FALSE)
  saveRDS(x, test_path("outputs/test_rds.rds"))

  rm(list = "x")

  expect_error(import_rds_to_object(test_path("outputs"), date = lubridate::today() + lubridate::days(10)),
               "These rds files in")

  file.remove(test_path("outputs/test_rds.rds"))
  unlink(test_path("outputs"), recursive = TRUE)

})

test_that("no rds files in output ", {

  expect_error(import_rds_to_object(test_path("outputs")),
               "There are no rds files")

})
