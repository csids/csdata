#' @export
add_granularity_geo_to_data_set.data.table <- function(x, location_reference = NULL){
  granularity_geo <- NULL

  x[, granularity_geo := location_code_to_granularity_geo(x, location_reference = location_reference)]
  data.table::shouldPrint(x)
  invisible(x)
}

#' Adds granularity_geo to a given data set
#'
#' @param x A data.table containing a column called "location_code".
#' @param location_reference A location reference data.table.
#' @returns A data.table containing an extra column called "granularity_geo".
#' @examples
#' library(data.table)
#' data <- data.table(location_code = c("norge", "county03", "blah"))
#' csdata::add_granularity_geo_to_data_set(data)
#' print(data)
#'
#' library(data.table)
#' data <- data.table(location_code = c("norge", "county03", "blah"))
#' csdata::add_granularity_geo_to_data_set(data, location_reference = csdata::nor_locations_names())
#' print(data)
#' @export
add_granularity_geo_to_data_set <- function(x, location_reference = NULL){
  UseMethod("add_granularity_geo_to_data_set")
}

#' @export
add_iso3_to_data_set.data.table <- function(x){
  granularity_geo <- NULL

  x[, granularity_geo := location_code_to_iso3(x)]
  data.table::shouldPrint(x)
  invisible(x)
}

#' Adds iso3 to a given data set
#'
#' @param x A data.table containing a column called "location_code".
#' @returns A data.table containing an extra column called "iso3".
#' @examples
#' library(data.table)
#' data <- data.table(location_code = c("norge", "county03", "blah"))
#' csdata::add_iso3_to_data_set(data)
#' print(data)
#' @export
add_iso3_to_data_set <- function(x){
  UseMethod("add_iso3_to_data_set")
}
