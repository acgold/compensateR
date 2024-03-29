% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DO_units_convert.R
\name{DO_adjust_units}
\alias{DO_adjust_units}
\title{convert dissolved oxygen from mg/L to percent saturation}
\usage{
DO_adjust_units(
  temperature,
  dissolved_oxygen,
  salinity = rep(0, length(temperature))
)
}
\arguments{
\item{temperature}{A vector or 1-D column of temperature measurements that coincide with conductivity measurements}

\item{dissolved_oxygen}{A vector or 1-D column of dissolved measurements that coincide with temperature measurements}

\item{salinity}{A vector or 1-D column of salinity measurements that coincide with temperature measurements}
}
\value{
Dissolved oxygen values converted to percent saturation
}
\description{
\code{DO_convert_units} accepts dissolved oxygen and temperature measurements
and adjusts dissolved oxygen based on solubility of oxygen at
different temperatures. Uses USGS methods (citing Garcia and Gordon, 1992)
found here: \url{https://water.usgs.gov/admin/memo/QW/qw11.03.pdf}
}
