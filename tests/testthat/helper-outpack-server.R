outpack_server_endpoint <- function(method, path, root, validate = TRUE) {
  porcelain::porcelain_package_endpoint("outpack.server", method, path,
                                        state = list(root = root),
                                        validate = validate)
}


## Helpers from outpack:
create_random_packet <- function(root, name = "data", parameters = NULL) {
  src <- dir_create(tempfile())
  on.exit(unlink(src, recursive = TRUE))
  saveRDS(runif(10), file.path(src, "data.rds"))
  id <- outpack::outpack_packet_start(src, name, parameters = parameters,
                                      root = root)$id
  outpack::outpack_packet_end()
  id
}


create_random_packet_chain <- function(root, length) {
  src <- dir_create(tempfile())
  on.exit(unlink(src, recursive = TRUE))

  id <- character()
  for (i in seq_len(length)) {
    nm <- letters[[i]]
    p <- file.path(src, nm)
    dir_create(p)
    id[[nm]] <- outpack::outpack_packet_start(p, nm, root = root)$id

    if (i == 1) {
      saveRDS(runif(10), file.path(p, "data.rds"))
    } else {
      code <- sprintf("saveRDS(readRDS('input.rds') * %d, 'data.rds')", i)
      writeLines(code, file.path(p, "script.R"))
      outpack::outpack_packet_use_dependency(id[[letters[i - 1]]],
                                    c("input.rds" = "data.rds"))
      outpack::outpack_packet_run("script.R")
    }
    outpack::outpack_packet_end()
  }

  id
}


create_temporary_root <- function(...) {
  path <- tempfile()
  withr::defer_parent(unlink(path, recursive = TRUE))
  outpack::outpack_init(path, ...)
}


dir_create <- function(path) {
  dir.create(path, FALSE, TRUE)
  path
}
