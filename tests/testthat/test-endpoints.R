test_that("root data returns sensible, validated, data", {
  ## Just hello world for the package really
  endpoint <- outpack_server_endpoint("GET", "/")
  res <- endpoint$run()
  expect_true(res$validated)
  expect_true(all(c("outpack", "outpack.server") %in%
                  names(res$data)))
  expect_match(unlist(res$data), "^[0-9]+\\.[0-9]+\\.[0-9]+$")
})


test_that("Can construct the api", {
  obj <- api()
  result <- evaluate_promise(value <- obj$request("GET", "/")$status)
  expect_equal(value, 200)
  logs <- lapply(strsplit(result$output, "\n")[[1]], jsonlite::parse_json)
  expect_length(logs, 2)
  expect_equal(logs[[1]]$logger, "outpack.server")
})
