`%||%` <- function(x, y) { # nolint
  if (is.null(x)) y else x
}


scalar <- function(x) {
  jsonlite::unbox(x)
}


package_version_string <- function(name) {
  as.character(utils::packageVersion(name))
}


read_string <- function(path) {
  trimws(paste(readLines(path), collapse = "\n"))
}


read_binary <- function(path) {
  readBin(path, raw(), file.size(path))
}


json_string <- function(txt) {
  class(txt) <- "json"
  txt
}
