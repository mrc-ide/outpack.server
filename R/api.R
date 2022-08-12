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


##' @porcelain GET /metadata/list => json
##'   state root :: root
metadata_list <- function(root) {
  root$index()$location[c("packet", "time", "hash")]
}


##' @porcelain GET /metadata/get/<id> => json
##'   state root :: root
metadata_get <- function(root, id) {
  dat <- root$index()$location
  if (!any(dat$packet == id)) {
    ## TODO: return 404 here?
    stop(sprintf("packet id '%s' not found", id))
  }
  path <- file.path(root$path, ".outpack", "metadata", id)
  str <- read_string(path)
  class(str) <- "json"
  str
}


##' @porcelain GET /file/<hash> => binary
##'   state root :: root
##'
file <- function(root, hash) {
  browser()
}
