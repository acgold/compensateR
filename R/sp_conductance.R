#' Calculate specific conductance
#'
#'\code{sp_conductance} accepts conductivity and temperature measurements
#'and converts them to values of specific conductance at 25˚C
#'
#'@param temperature A vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@param conductivity A vector or 1-D column of conductivity measurements that coincide with temperature measurements
#'@return Specific conductance values adjusted to 25˚C
#'@export
sp_conductance <- function(temperature, conductivity){
  temperature <- c(temperature)
  conductivity <- c(conductivity)

  if(length(temperature) != length(conductivity)){
    return("Lengths do not match!")
  }

  specific_conductance <- conductivity/(1 - ((25 - temperature)*2/100))
  return(specific_conductance)
}
