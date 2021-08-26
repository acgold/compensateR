#' Calculate salinity using specific conductivity
#'
#'\code{salinity} Accepts specific conductance values (uS/cm) and
#'converts them to practical salinity units (PSU, dimensionless). Equations from Schemel 2001 (as described here: https://pubs.usgs.gov/tm/2006/tm1D3/pdf/TM1D3.pdf)
#'
#'@param specific_conductance a vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@return Practical salinity units (PSU)
#'@export
salinity <- function(specific_conductance){
  sc <- c(specific_conductance)

  R <- sc/53087

  k1 <- 0.0120
  k2 <- -0.2174
  k3 <- 25.3283
  k4 <- 13.7714
  k5 <- -6.4788
  k6 <- 2.5842

  salinity <- k1 + (k2 * (R^(1/2))) + (k3 * R) + (k4 * (R^(3/2))) + (k5 *( R^2)) + (k6 * (R^(5/2)))

  return(salinity)
}
