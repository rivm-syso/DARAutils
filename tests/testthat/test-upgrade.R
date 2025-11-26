test_that("test exist new config files", {
  local_logger_sink()
  current_wd <- getwd() # test directory

  withr::with_tempdir(
    clean = TRUE,
    code = {
      upgrade_config(
        config_file_old = file.path(current_wd, "fixtures/config/config_example.yaml"),
        config_dir_new = getwd()
      ) # temp directory
      expect_true(
        file.exists("base/file_paths.yaml"),
        file.exists("base/object_definitions.yaml"),
        file.exists("base/object_relations.yaml")
      )
    }
  )
})


for (file_name in c("file_paths.yaml", "object_definitions.yaml", "object_relations.yaml")) {
  test_that("test {file_name} correct", {
    local_logger_sink()
    current_wd <- getwd() # test directory

    withr::with_tempdir(
      clean = TRUE,
      code = {
        upgrade_config(
          config_file_old = file.path(current_wd, "fixtures/config/config_example.yaml"),
          config_dir_new = getwd()
        ) # temp directory
        expect_identical(
          read_yaml(file.path(current_wd, "fixtures/upgrade/config/base/", file_name)),
          read_yaml(file.path("base/", file_name))
        )
      }
    )
  })
}
