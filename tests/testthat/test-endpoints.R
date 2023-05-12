test_that("root data returns sensible, validated, data", {
  ## Just hello world for the package really
  endpoint <- outpack_server_endpoint("GET", "/", NULL)
  res <- endpoint$run()
  expect_true(res$validated)
  expect_true(all(c("outpack", "outpack.server") %in%
                  names(res$data)))
  expect_match(unlist(res$data), "^[0-9]+\\.[0-9]+\\.[0-9]+$")
})


test_that("Can construct the api", {
  root <- create_temporary_root(use_file_store = TRUE)
  obj <- api(root)
  result <- evaluate_promise(value <- obj$request("GET", "/")$status)
  expect_equal(value, 200)
  logs <- lapply(strsplit(result$output, "\n")[[1]], jsonlite::parse_json)
  expect_length(logs, 2)
  expect_equal(logs[[1]]$logger, "outpack.server")
})


test_that("Can list metadata", {
  root <- create_temporary_root(use_file_store = TRUE)
  ids <- create_random_packet_chain(root, 4)

  endpoint <- outpack_server_endpoint("GET", "/metadata/list", root)
  res <- endpoint$run()

  cols <- c("packet", "time", "hash")
  expected <- root$index()$location[cols]
  expected$time <- as.numeric(expected$time)

  expect_true(res$validated)
  expect_equal(res$content_type, "application/json")
  expect_equal(res$data, expected)
})


test_that("Can retrieve metadata", {
  root <- create_temporary_root(use_file_store = TRUE)
  id <- create_random_packet(root)
  meta <- root$metadata(id)
  hash <- meta$files$hash

  endpoint <- outpack_server_endpoint("GET", "/metadata/<id>/json", root)
  res <- endpoint$run(id)
  expect_true(res$validated)
  expect_identical(
    res$data,
    json_string(read_string(file.path(root$path, ".outpack", "metadata", id))))
  expect_equal(res$status_code, 200)
  expect_equal(res$content_type, "application/json")
})


test_that("Can retrieve metadata in plain text", {
  root <- create_temporary_root(use_file_store = TRUE)
  id <- create_random_packet(root)
  meta <- root$metadata(id)
  hash <- meta$files$hash

  endpoint <- outpack_server_endpoint("GET", "/metadata/<id>/text", root)
  res <- endpoint$run(id)
  expect_true(res$validated)
  expect_identical(
    res$data,
    json_string(read_string(file.path(root$path, ".outpack", "metadata", id))))
  expect_equal(res$status_code, 200)
  expect_equal(res$content_type, "text/plain")
})


test_that("Throw 404 if packet metadata not found", {
  root <- create_temporary_root(use_file_store = TRUE)
  id <- "20220812-141127-c568fb24"
  endpoint <- outpack_server_endpoint("GET", "/metadata/<id>/json", root)
  res <- endpoint$run(id)

  expect_equal(res$status_code, 404)
  expect_equal(res$value$errors[[1]]$error, scalar("NOT_FOUND"))
  expect_equal(res$value$errors[[1]]$detail,
               scalar("packet id '20220812-141127-c568fb24' not found"))
})


test_that("Can retrieve files", {
  root <- create_temporary_root(use_file_store = TRUE)
  id <- create_random_packet(root)
  meta <- root$metadata(id)
  hash <- meta$files$hash[meta$files$path == "data.rds"]

  endpoint <- outpack_server_endpoint("GET", "/file/<hash>", root)
  res <- endpoint$run(hash)
  expect_true(res$validated)
  expect_identical(
    res$data,
    read_binary(file.path(root$path, "archive", "data", id, "data.rds")))
  expect_equal(res$status_code, 200)
  expect_equal(res$content_type, "application/octet-stream")
})


test_that("Throw 404 if file hash not found", {
  root <- create_temporary_root(use_file_store = TRUE)
  id <- create_random_packet(root)
  meta <- root$metadata(id)
  hash <- "md5:637752d86f9f60b8a9c0de7ff20cf8a8"

  endpoint <- outpack_server_endpoint("GET", "/file/<hash>", root)
  res <- endpoint$run(hash)
  expect_equal(res$status_code, 404)
  expect_equal(res$value$errors[[1]]$error, scalar("NOT_FOUND"))
  expect_equal(res$value$errors[[1]]$detail,
               scalar("hash 'md5:637752d86f9f60b8a9c0de7ff20cf8a8' not found"))
})
