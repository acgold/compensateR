# compensateR
An R package used to compensate unprocessed data from environmental sensors for temperature and salinity. 

## Dissolved Oxygen
Temperature and salinity compensation performed using equations from Garcia and Gordon, 1992. Described and summarized here: https://water.usgs.gov/admin/memo/QW/qw11.03.pdf

## Conductivity
Calculation of specific conductance performed using a simple linear equation:

Specific conductance = conductivity /(1 - ((25-T) * 0.02)) 
%5CSpecific+conductance+%3D+conductivity+%2F%281+-+%28%2825-T%29+%2A+0.02%29%29+%7D

Where: T = water temperature in degrees C 

## References
Garcia, H.E., and Gordon, L.I., 1992, Oxygen solubility in seawater—Better fitting equations: Limnology and Oceanography, vol. 37, no. 6, p. 1307-1312. (Also available at http://www.jstor.org/stable/pdfplus/2837876.pdf.)
