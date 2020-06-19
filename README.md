# compensateR
An R package used to compensate unprocessed data from environmental sensors for temperature and salinity. 

Install `compensateR` using `devtools`:
```R
install.packages("devtools")
devtools::install_github("acgold/compensateR")
```

## Dissolved Oxygen
Temperature + salinity compensation and conversion from mg/L to % saturation performed using equations from Garcia and Gordon, 1992. Described and summarized here: https://water.usgs.gov/admin/memo/QW/qw11.03.pdf

#### Example
```R
temperature <- rnorm(10, mean = 25, sd = 8)
dissolved_oxygen <- rnorm(10, mean = 6, sd = 2)

adj_DO <- DO_adjust(base_temp = 25, temperature = temperature, dissolved_oxygen = dissolved_oxygen)
perc_sat <- DO_adjust_units(temperature = temperature, dissolved_oxygen = adj_DO)
```
## Specific Conductivity & Salinity
Calculation of specific conductance performed using a simple linear equation with 2% difference/degree used by the US EPA and described in Standard Methods:

>**Specific conductance = conductivity /(1 - ((25-T) * 0.02))** 

where T = water temperature in ˚C 

Salinity is estimated using specific conductivity and the following equation:

 >**Salinity = (5.572E-4 * specific_conductance) + (2.02E-9 * specific_conductance^2)**

#### Examples
```R
conductivity <- rnorm(10, 500, sd = 100)
temperature <- rnorm(10, mean = 25, sd = 8)

sc <- sp_conductance(temperature = temperature, conductivity = conductivity)

sal <- salinity(sc)
```

## More Resources
Overview of temperature and salinity compensation: https://www.fondriest.com/environmental-measurements/parameters/water-quality/conductivity-salinity-tds/

## References
Fondriest Environmental, Inc. “Conductivity, Salinity and Total Dissolved Solids.” Fundamentals of Environmental Measurements. 3 Mar 2014. Web. URL:https://www.fondriest.com/environmental-measurements/parameters/water-quality/conductivity-salinity-tds/

Garcia, H.E., and Gordon, L.I., 1992, Oxygen solubility in seawater—Better fitting equations: Limnology and Oceanography, vol. 37, no. 6, p. 1307-1312. URL:http://www.jstor.org/stable/pdfplus/2837876.pdf

Standard Methods For the Examination of Water and Wastewater, 2510 CONDUCTIVITY (2017), DOI:10.2105/SMWW.2882.027, URL:https://www.standardmethods.org/doi/full/10.2105/SMWW.2882.027

US EPA, 1982, Method 120.1: Conductance (Specific Conductance, µmhos at 25˚C) by Conductivity Meter, URL:https://www.epa.gov/sites/production/files/2015-08/documents/method_120-1_1982.pdf
