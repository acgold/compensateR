#' Calculate salinity using specific conductivity
#'
#'\code{salinity} Accepts specific conductance values and
#'converts them to practical salinity units (PSU) in ppt
#'
#'@param specific_conductance a vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@return Practical salinity units, PSU, in parts per thousand
#'@export
salinity <- function(specific_conductance){
  specific_conductance <- c(specific_conductance)

  salinity <- ((5.572E-4)*specific_conductance) + ((2.02E-9)*specific_conductance^2)
  return(salinity)
}
