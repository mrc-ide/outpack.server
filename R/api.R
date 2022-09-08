##' Create an outpack server, a porcelain object
##'
##' @title Create outpack server
##'
##' @param root Outpack root
##'
##' @param validate Logical, indicating if validation should be done
##'   on responses.  This should be `FALSE` in production
##'   environments.  See [porcelain::porcelain] for details
##'
##' @param log_level Logging level to use. Sensible options are "off",
##'   "info" and "all".
##'
##' @return A [porcelain::porcelain] object. Notably this does *not*
##'   start the server
##'
##' @export
api <- function(root, validate = NULL, log_level = "info") {
  root <- outpack::outpack_root_open(root, locate = FALSE)
  ## TODO: should we check for use_file_store and require_complete_tree here?

  logger <- porcelain::porcelain_logger(log_level)
  api <- porcelain::porcelain$new(validate = validate, logger = logger)
  api$include_package_endpoints(state = list(root = root))
  api
}


##' @porcelain GET / => json(root)
root <- function() {
  versions <- list(outpack = package_version_string("outpack"),
                   outpack.server = package_version_string("outpack.server"))
  lapply(versions, scalar)
}


##' @porcelain GET /metadata/list => json(list)
##'   state root :: root
metadata_list <- function(root) {
  ret <- root$index(refresh = TRUE)$location[c("packet", "time", "hash")]
  ret$time <- as.numeric(unclass(ret$time))
  ret
}


## TODO: It might be nicer to have a single GET endpoint that flips
## based on a header, but porcelain does not allow this!

##' @porcelain GET /metadata/<id>/json => json(metadata)
##'   state root :: root
metadata_get_json <- function(root, id) {
  metadata_get(root, id)
}


##' @porcelain GET /metadata/<id>/text => text
##'   state root :: root
metadata_get_text <- function(root, id) {
  metadata_get(root, id)
}


metadata_get <- function(root, id) {
  dat <- root$index()$location
  if (!any(dat$packet == id)) {
    porcelain::porcelain_stop(sprintf("packet id '%s' not found", id),
                              code = "NOT_FOUND", status_code = 404L)
  }
  ## TODO: add outpack method to make this easier
  json_string(read_string(file.path(root$path, ".outpack", "metadata", id)))
}


##' @porcelain GET /file/<hash> => binary
##'   state root :: root
##'
file_get <- function(root, hash) {
  path <- root$files$filename(hash)
  if (!file.exists(path)) {
    porcelain::porcelain_stop(sprintf("hash '%s' not found", hash),
                              code = "NOT_FOUND", status_code = 404L)
  }
  read_binary(path)
}
