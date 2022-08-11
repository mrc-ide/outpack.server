test_that("can run server", {
  bg <- porcelain::porcelain_background$new(api)
  bg$start()
  r <- bg$request("GET", "/")
  expect_equal(httr::status_code(r), 200)

  dat <- httr::content(r)
  expect_equal(dat$status, "success")
  expect_null(dat$errors)
  expect_equal(dat$data$outpack,
               package_version_string("outpack"))
  expect_equal(dat$data$outpack.server,
               package_version_string("outpack.server"))
})
