#' convert dissolved oxygen from mg/L to percent saturation
#'
#'\code{DO_convert_units} accepts dissolved oxygen and temperature measurements
#'and adjusts dissolved oxygen based on solubility of oxygen at
#'different temperatures. Uses USGS methods (citing Garcia and Gordon, 1992)
#'found here: \url{https://water.usgs.gov/admin/memo/QW/qw11.03.pdf}
#'
#'@param base_temp The temperature (˚C) that dissolved oxygen probe measures against. Default 25˚C
#'@param temperature A vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@param dissolved_oxygen A vector or 1-D column of dissolved measurements that coincide with temperature measurements
#'@return Dissolved oxygen values converted to percent saturation
#'@export
DO_adjust_units <- function(temperature, dissolved_oxygen){
  t <- c(temperature)
  d <- c(dissolved_oxygen)

  if(length(t) != length(d)){
    return("Lengths do not match!")
  }

  adj_t <- log((298.15 - t)/(273.15 + t))

  adj_DO <- 1.42905 * exp(2.00907 + (3.22014*adj_t) + (4.05010*adj_t^2) + (4.94457*adj_t^3) - (0.256847*adj_t^4) + (3.88767*adj_t^5))

  final_DO <- 100* (d/adj_DO)

  return(final_DO)
}
