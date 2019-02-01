#' Test installation for rhdf5
#'
#' Nothing returned if everything is ok
#'
#' @importFrom utils packageVersion
#'
#' @export
test_install <- function() {

  warning_msg <- c(
    "If you want to play with data from MaMut, you're good!\n",
    "If you plan to extract values from HDF5 files with function `getFluo()`, you need package (rhdf5 > 2.24).\n",
    ifelse(getRversion() < 3.5,
           "- {rhdf5} will only work with R > 3.5, please upgrade your R installation: https://www.r-project.org/\n",
           ""),
    "- Please install {rhdf5} using:\n",
    "    install.packages(\"BiocManager\"); ",
    "BiocManager::install(\"rhdf5\")")

  if (!requireNamespace("rhdf5")) {
    warning(warning_msg)
  } else if (packageVersion("rhdf5") < 2.24 | getRversion() < 3.5) {
    warning(warning_msg)
  }
}
