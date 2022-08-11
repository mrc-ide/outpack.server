outpack_server_endpoint <- function(..., validate = TRUE) {
  ## TODO: export from porcelain!
  ## TODO: should this default be true for testing?
  porcelain:::porcelain_package_endpoint("outpack.server", ...,
                                         validate = validate)
}
