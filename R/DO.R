#' Adjust dissolved oxygen
#'
#'\code{DO_adjust} accepts dissolved oxygen and temperature measurements
#'and adjusts dissolved oxygen based on solubility of oxygen at
#'different temperatures assuming constant pressure. Uses USGS methods (citing Garcia and Gordon, 1992)
#'found here: \url{https://water.usgs.gov/admin/memo/QW/qw11.03.pdf}
#'
#'@param base_temp The temperature (˚C) that dissolved oxygen probe measures against. Default 25˚C
#'@param temperature A vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@param dissolved_oxygen A vector or 1-D column of dissolved measurements that coincide with temperature measurements
#'@param salinity A vector or 1-D column of salinity measurements that coincide with temperature measurements. Can be calculated
#'from conductivity and temperature using \code{\link{salinity}}
#'@return Dissolved oxygen values adjusted for temperature
#'@export
DO_adjust <- function(base_temp = 25, temperature, dissolved_oxygen, salinity = rep(0,length(temperature))){
  t <- c(temperature)
  d <- c(dissolved_oxygen)
  s = c(salinity)

  if(length(t) != length(d) | length(t) != length(s) ){
    return("Lengths do not match!")
  }

  base_t <- log((298.15 - base_temp)/(273.15 + base_temp))
  adj_t <- log((298.15 - t)/(273.15 + t))

  base_do <- 1.42905 * exp(2.00907 + (3.22014*base_t) + (4.05010*base_t^2) + (4.94457*base_t^3) - (0.256847*base_t^4) + (3.88767*base_t^5))
  adj_DO <- 1.42905 * exp(2.00907 + (3.22014*adj_t) + (4.05010*adj_t^2) + (4.94457*adj_t^3) - (0.256847*adj_t^4) + (3.88767*adj_t^5))

  Fs <- exp(((-0.00624523 - (0.00737614*adj_t) - (0.0103410*adj_t^2) - (0.00817083*adj_t^3))*s) - 4.88682E-7*s^2)

  final_DO <- (d/base_do) *(adj_DO * Fs)

  return(final_DO)
}
