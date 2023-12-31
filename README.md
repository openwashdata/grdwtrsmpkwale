
<!-- README.md is generated from README.Rmd. Please edit that file -->

# grdwtrsmpkwale

<!-- badges: start -->

[![License: CC BY
4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![R-CMD-check](https://github.com/openwashdata/grdwtrsmpkwale/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/openwashdata/grdwtrsmpkwale/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of `grdwtrsmpkwale` is to provide datasets for research and
planning of water and solid waste management in Kwale, Kenya. This
package includes water anlaysis data collected in 2016 combined with the
geospatial data from the collection points. The data is collected part
of the project UPGro (Unlocking the Potential of Groundwater for the
Poor) which aimed to improve the evidence and understanding of
groundwater across Sub-Saharan Africa to help tackle poverty.

## Installation

You can install the development version of ‘grdwtrsmpkwale’ from
[GitHub](https://github.com/openwashdata/grdwtrsmpkwale) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/grdwtrsmpkwale")
```

Alternatively, you can download the individual datasets as CSV or XLSX
file from the table below.

| dataset          | CSV                                                                                                       | XLSX                                                                                                        |
|:-----------------|:----------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------|
| water_samples    | [Download CSV](https://github.com/openwashdata/grdwtrsmpkwale/raw/main/inst/extdata/water_samples.csv)    | [Download XLSX](https://github.com/openwashdata/grdwtrsmpkwale/raw/main/inst/extdata/water_samples.xlsx)    |
| selected_samples | [Download CSV](https://github.com/openwashdata/grdwtrsmpkwale/raw/main/inst/extdata/selected_samples.csv) | [Download XLSX](https://github.com/openwashdata/grdwtrsmpkwale/raw/main/inst/extdata/selected_samples.xlsx) |

# Introduction

This dataset contains results of two sampling campaigns conducted in
Kwale County Kenya in March and June 2016 by GHS/UPC as part of the Gro
for GooD project.[^1]

Water samples from over 79 groundwater and 6 surface water (SW)
locations were analysed for major ions, stable isotopes, selected trace
constituents, electrical conductivity, nitrates, ammonia, pH, DO
(Dissolved Oxygen), Eh (oxidation / reduction potential), Temperature,
TOC (Total Organic Carbon) and field alkalinity. Most locations were
sampled in both March (dry season) and June (wet season).

# Data

This data package has two datasets: `water_samples` and
`selected_samples`.

``` r
library(grdwtrsmpkwale)
```

## water_samples

This dataset contains data from an analysis of groundwater in Kwale,
Kenya. The data was collected once in March and once in June of 2016 for
each sampling spot. In total 157 samples were taken in 71 different
localisations that have their geospatial data included in this data
package. The sample analysis includes different measurements including
conductivity, temperature, pH-values and concentrations of different
elements/molecules for the groundwater samples.

The `water_samples` data set has 80 variables and 157 observations. For
an overview of the variable names, see the following table.

``` r
water_samples
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:400px; ">

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
variable_name
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
variable_type
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
description
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
unit_type
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
error
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
localization
</td>
<td style="text-align:left;">
character
</td>
<td style="text-align:left;">
Name of the localization where the sample was taken.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
geology
</td>
<td style="text-align:left;">
character
</td>
<td style="text-align:left;">
Composition of the ground.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
utm_x
</td>
<td style="text-align:left;">
character
</td>
<td style="text-align:left;">
Geospatial data of the water sampling locations. The geographic
coordinate system ‘Arc 1960 / UTM zone 37S’ (EPSG:21037) which is used
for the areas of Kenya and Tanzania - south of equator and east of 36°E.
</td>
<td style="text-align:left;">
Arc 1960
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
utm_y
</td>
<td style="text-align:left;">
character
</td>
<td style="text-align:left;">
Geospatial data of the water sampling locations. The geographic
coordinate system ‘Arc 1960 / UTM zone 37S’ (EPSG:21037) which is used
for the areas of Kenya and Tanzania - south of equator and east of 36°E.
</td>
<td style="text-align:left;">
Arc 1960
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
date
</td>
<td style="text-align:left;">
dttm
</td>
<td style="text-align:left;">
Date the sample was taken.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
conductivity
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Conductivity of the sample in (µS/cm)
</td>
<td style="text-align:left;">
(µS/cm)
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
T_avg
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Average ambient temperature at the time of the sampling
</td>
<td style="text-align:left;">
°C
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
pH
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Acidity/basicity of the sample using the pH value.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
TOC
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Total organic carbon (TOC) is an analytical parameter representing the
concentration of organic carbon in a sample.
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
alkalinity
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Alkalinity of the sample as mg of bicarbonate (HCO3) per liter
(mg_HCO3/L).
</td>
<td style="text-align:left;">
as mg/L HCO3
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
DO
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Dissolved oxygen (DO) levels in environmental water depend on the
physiochemical and biochemical activities in water body and it is an
important useful in pollution and waste treatment process control.
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
ORP
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Oxidation reduction potential (ORP) in (mV).
</td>
<td style="text-align:left;">
mV
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
eH
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Redox potential (eH) in (mV).
</td>
<td style="text-align:left;">
mV
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
NH4
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Ammonium concentration in (mg/L).
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Cl
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Chlorine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.042 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
SO4
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sulfate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.026mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
NO3
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Nitrate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.005mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
PO4
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Phosphate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0,008 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Br
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Bromine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.004mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
F
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Fluorine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.024mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Ca
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Calcium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Mg
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Magnesium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Na
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sodium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
K
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Potassium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Fe
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Iron concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Si
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Silicon concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.02 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Al
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Aluminum concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
S
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sulfur concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
P
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Phosphorus concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Li
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lithium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Be
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Beryllium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
B
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Boron concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sc
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Scandium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ti
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Titanium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
V
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Vanadium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Chromium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Mn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Manganese concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Co
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cobalt concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ni
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Nickel concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Copper concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Zn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Zinc concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ga
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Gallium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ge
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Germanium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
As
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Arsenic concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Se
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Selenium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Rb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Rubidium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Strontium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Y
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Yttrium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Zr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Zirconium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Nb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Niobium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Mo
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Molybdenum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cadmium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Tin concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Antimony concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cs
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cesium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ba
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Barium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
La
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lanthanum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ce
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cerium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Pr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Praseodymium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Nd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Neodymium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sm
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Samarium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Eu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Europium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Gd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Gadolinium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Terbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Dy
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Dysprosium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ho
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Holmium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Er
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Erbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tm
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thulium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Yb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Ytterbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Lu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lutetium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Hf
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Hafnium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ta
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Tantalum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Wolfram concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tl
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thallium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Pb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lead concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Bi
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Bismuth concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Th
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thorium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Uranium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
delta_O_18
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
The ratio of stable isotopes oxygen-18 (18O) and oxygen-16 (16O) as a
measure of groundwater/mineral interactions.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
delta_H_2
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
δ2H, or delta deuterium, is a measure of the relative abundance of
deuterium (a stable isotope of hydrogen) in a sample, often used in
hydrology and environmental science to trace the origin and movement of
water.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
</tbody>
</table>

</div>

<div class="figure" style="text-align: center">

<img src="man/figures/README-fig-location-plot-1.png" alt="Locations of sampling spots" width="100%" />
<p class="caption">
Locations of sampling spots
</p>

</div>

## selected_samples

This dataset contains data from an analysis of groundwater in Kwale,
Kenya. The data was collected three weeks in a row at 8 different
locations. The sample analysis includes measurements of conductivity,
temperature, pH-values and concentrations of different
elements/molecules.

The `selected_samples` data set has 69 variables and 24 observations.
For an overview of the variable names, see the following table.

``` r
selected_samples
```

<div style="border: 1px solid #ddd; padding: 0px; overflow-y: scroll; height:400px; ">

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
variable_name
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
variable_type
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
description
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
unit_type
</th>
<th style="text-align:left;position: sticky; top:0; background-color: #FFFFFF;">
error
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
code
</td>
<td style="text-align:left;">
character
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
LOD
</td>
</tr>
<tr>
<td style="text-align:left;">
date
</td>
<td style="text-align:left;">
dttm
</td>
<td style="text-align:left;">
Date the sample was taken.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
conductivity
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Conductivity of the sample in (µS/cm)
</td>
<td style="text-align:left;">
(µS/cm)
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
T_avg
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Average ambient temperature at the time of the sampling
</td>
<td style="text-align:left;">
°C
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
pH
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Acidity/basicity of the sample using the pH value.
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Cl
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Chlorine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.042 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
SO4
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sulfate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.026mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
NO3
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Nitrate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.005mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
PO4
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Phosphate concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0,008 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Br
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Bromine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.019mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
F
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Fluorine concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.024mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Ca
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Calcium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Mg
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Magnesium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Na
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sodium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
K
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Potassium concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Fe
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Iron concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Si
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Silicon concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.02 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Al
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Aluminum concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
S
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Sulfur concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.05 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
P
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Phosphorus concentration in (mg/L)
</td>
<td style="text-align:left;">
(mg/L)
</td>
<td style="text-align:left;">
0.1 mg/L
</td>
</tr>
<tr>
<td style="text-align:left;">
Li
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lithium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Be
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Beryllium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
B
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Boron concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sc
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Scandium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ti
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Titanium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
V
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Vanadium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Chromium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Mn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Manganese concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Co
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cobalt concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ni
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Nickel concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Copper concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Zn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Zinc concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ga
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Gallium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ge
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Germanium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
As
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Arsenic concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Se
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Selenium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Rb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Rubidium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Strontium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Y
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Yttrium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Zr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Zirconium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Nb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Niobium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Mo
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Molybdenum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cadmium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sn
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Tin concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Antimony concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Cs
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cesium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ba
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Barium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
La
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lanthanum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ce
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Cerium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Pr
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Praseodymium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Nd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Neodymium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Sm
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Samarium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Eu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Europium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Gd
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Gadolinium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Terbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Dy
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Dysprosium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ho
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Holmium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Er
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Erbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tm
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thulium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Yb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Ytterbium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Lu
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lutetium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Hf
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Hafnium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Ta
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Tantalum concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
W
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Wolfram concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Tl
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thallium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Pb
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Lead concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Bi
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Bismuth concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
Th
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Thorium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
<tr>
<td style="text-align:left;">
U
</td>
<td style="text-align:left;">
double
</td>
<td style="text-align:left;">
Uranium concentration in parts per billion (ppb).
</td>
<td style="text-align:left;">
ppb
</td>
<td style="text-align:left;">
0.08 ppb
</td>
</tr>
</tbody>
</table>

</div>

## Example

``` r
sf_samples <- water_samples |> 
  mutate(date = ymd(date)) |> 
  mutate(month = month(date), .after = date) |> 
  drop_na(month) |> 
  st_as_sf(coords = c("utm_x", "utm_y"), crs = 21037) |>
  st_transform(crs = 4236)

tmap_mode("view")

tm_shape(sf_samples) +
  tm_dots(col = "pH", size = 0.1, alpha = 0.7, palette = "RdBu") +
  tm_facets(by = "month", as.layers = TRUE) +
  tm_layout(panel.labels = c("March", "June"))
```

<div class="figure" style="text-align: center">

<img src="man/figures/screenshot-map-sampling-spots.png" alt="Screenshot of an interactive map with OpenStreetMap layer." width="100%" />
<p class="caption">
Screenshot of an interactive map with OpenStreetMap layer.
</p>

</div>

# License

Data are available as
[CC-BY](https://github.com/openwashdata/grdwtrsmpkwale/blob/main/LICENSE.md).

# Citation

    #> To cite package 'grdwtrsmpkwale' in publications use:
    #> 
    #>   Loos S, Zhong M, Hope R (????). _grdwtrsmpkwale: Groundwater analysis
    #>   from 2016 in Kwale, Kenya_. R package version 0.0.0.9000,
    #>   <https://github.com/openwashdata/grdwtrsmpkwale>.
    #> 
    #> A BibTeX entry for LaTeX users is
    #> 
    #>   @Manual{,
    #>     title = {grdwtrsmpkwale: Groundwater analysis from 2016 in Kwale, Kenya},
    #>     author = {Sebastian Camilo Loos and Mian Zhong and Rob Hope},
    #>     note = {R package version 0.0.0.9000},
    #>     url = {https://github.com/openwashdata/grdwtrsmpkwale},
    #>   }

## Related References

\[1\] Ferrer et al, “[First step to understand the importance of new
deep aquifer pumping regime in groundwater system in a developing
country, Kwale,
Kenya](http://meetingorganizer.copernicus.org/EGU2016/EGU2016-16969.pdf)”,
Geophysical Research Abstracts, Vol. 18, EGU2016-16969, 2016; Poster
Avaiblable:
<https://upgro.files.wordpress.com/2015/09/egu16_groforgood_v1.pdf>;
UPC - The Departement of Civil Enginyering de la Universitat Politecnica
de Catalunya GHS - Grupo de Hidrologia Subterranea

[^1]: <https://metadata.bgs.ac.uk/geonetwork/srv/eng/catalog.search#/metadata/50cdcbae-bc14-628b-e054-002128a47908>
