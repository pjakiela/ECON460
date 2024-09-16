# Data Analysis Assignment 2

_Data Assignment 2 is due by 11:00 PM on September 29._

## Overview

For this assignment, you will be exploring the role of ancestral characteristics in explaining women's legal equality in the present.  To do this, 
you will combine data from the Ethnographic Atlas with the World Bank's 
[Women, Business, and the Law](https://wbl.worldbank.org/en/wbl) database.  The [Ethnographic Atlas](https://d-place.org/contributions/EA) 
characterizes the characteristics of 1,291 pre-industrial societies; it was compiled by the antrhopologist George Murdock, who attempted 
to systematize the enormous amount of information recorded by ethnographers doing field work in traditional communities.  [Paola Giuliano](https://www.anderson.ucla.edu/faculty-and-research/global-economics-and-management/faculty/giuliano) and 
[Nathan Nunn](https://nathannunn.arts.ubc.ca/) have used the Ethnographic Atlas to construct [a data set mapping current populations to 
the attributes of the pre-industrial societies of their ancestors](https://econ2017.sites.olt.ubc.ca/files/2022/01/nathannunn_Ancestral-Characteristics.pdf).  We will be 
using their very cool data.

## Getting and Cleaning Your Data

For your analysis, you will use [this data set](ECON460-Giuliano-Nunn-data.dta), which is a subset of the country-level data included in 
Professor Giuliano and Professor Nunn's ancestral characteristics database.  We are only going to be working with 12 of the variables included in 
the Ethnographic Atlas:  those measuring monogamy, matrilocality and patrilocality, major crops, dieties, plows use, domestic animals, dairy production, 
sex segregation in the manufacture of cloth, sex segregation in the production of pottery, sex segregation in agriculture, inheritance systems, and 
norms surrounding premarital sex.  These csv files (in the links) provide information on the [12 Ethnographic Atlas variables](ECON460-EA-variables.csv) we are using and 
their [coding](ECON460-EA-codes.csv).  The Giuliano and Nunn data 
reports the percent of a country'ss current population whose ancestors fell into each of the categories included in the Ethnographic Atlas.  The do file 
[ECON460-data2-template.do](ECON460-data2-template.do) includes code that cleans three of the variables 
in the Giuliano-Nunn data (on monogamy, matrilocality and patrilocality, and use of the plow), 
aggregating them up into a smaller set of variables to be used in the analysis.  In addition to these three 
attributes of ancestral populations, you should pick two additional ones from the Giuliano and Nunn data that you will clean and include in 
your analysis.  You will need to decide how to aggregate the Ethnographic Atlas categories for analysis.

You will be merging the Giuliano-Nunn data with the World Bank's [Women, Business, and the Law (WBL) database](https://wbl.worldbank.org/en/wbl-data), 
which contains information on legal protections for women in 190 countries.  You should download the Women, Business and the Law 1.0 Data for 1971-2024 
in Stata format.  The WBL data set tracks legal changes over time, so it contains data for every year from 1970 through 2023.  For our main analysis, 
we'll be using data for 2023.  Before merging the WBL and plough data sets together, drop the other years from the WBL database.  The [do file template](ECON460-data2-template.do) will help you with this.

Once you have your clean data set, save it as `ECON460-YOURNAME-data2.dta`.  Save your cleaning do file as well.

## Analysis

Your next step is to write an analysis do file that produces the following:

1. A nicely-formatted, self-contained summary statistics table reporting the means, standard deviations, minima, maxima, and observation counts for the `WBL_index` variable from the WBL data as well as the Ethnographic Atlas variables constructed in your cleaning do file.
2. A horizontal bar graph (Stata command:  `graph hbar`) showing the mean of the `WBL_index` variable by World Bank country region.  Make sure that the bars/regions are sorted in order of increasing or decreasing length and that you've labeled the horizontal axis appropriately.
3. Two nicely-formatted regression tables:  (1) one showing (five total) regressions of `WBL_index` on each of the five groups of Ethnographic Atlas variables plus a sixth regression which includes all of your Ethnographic Atlas variables simultaneously, and (2) a second regression table which includes the same independent variables of interest, but controls for region and income group fixed effects.  

Once you've produced these pieces of analysis, you should produce a short written brief or memo describing your findings.  Please be sure to describe each of your tables and figures in the text.  

When you complete the assignment, you will upload the pdf of your written piece (including the tables and figures), your cleaning/merging do file, and your analysis do file.





