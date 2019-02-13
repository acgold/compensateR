#' Temperature and salinity compensation
#'
#'\code{compensate_all} accepts dissolved oxygen,temperature, and
#'conductivity measurements and produces temperature compensated
#'dissolved oxygen, specific conductance, and salinity values (optional).
#'
#'@param base_temp The temperature (˚C) that dissolved oxygen probe measures against. Default 25˚C
#'@param temperature A vector or 1-D column of temperature measurements that coincide with conductivity measurements
#'@param dissolved_oxygen A vector or 1-D column of dissolved measurements that coincide with temperature measurements
#'@param conductivity A vector or 1-D column of conductivity measurements that coincide with temperature measurements.
#'@param sal_comp Logical denoting whether or not to do salinity compensation. Leave as FALSE unless salinity goes above 2
#'@return Dissolved oxygen values adjusted for temperature, specific conductance values, and salinity values (optional)
#'@export
compensate_all <- function(base_temp = 25, temperature, dissolved_oxygen, conductivity, sal_comp = F){
  t <- c(temperature)
  do <- c(dissolved_oxygen)
  c <- c(conductivity)

  sp <- sp_conductance(t, c)
  sal <- rep(0,length(t))

  if(sal_comp == T){
    sal <- salinity(sp)
  }

  adj_DO <- DO_adjust(base_temp,t, do,sal)

  df <- data.frame("Adj_DO" = adj_DO, "Sp_Cond" = sp)

  if(sal_comp == T){
    df$Salinity = sal
  }

  return(df)
}
