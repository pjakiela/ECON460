# Data Analysis Assignment 3

_Data Assignment 3 is due ???._

## Overview

For this assignment, we will be using round 5, 6, and 7 of the [Afrobarometer](https://www.afrobarometer.org/).  Afrobarometer 
data contains information on political attitudes, values, and beliefs from representative population samples in 36 African countries.  We will 
combine the Afrobarometer data on information about female heads-of-state in Africa to estimate the impact of female leaders on gender 
attitudes in a two-way fixed effects framework.

## Getting Your Data

You [can download the Afrobarometer from here](https://www.afrobarometer.org/data/merged-data/).  There is a single merged file 
for each round (containing data from all the countries included in that round).  You need to download the data from Rounds 5, 6, 
and 7.  The data is in SPSS format, but you can convert it to Stata format using the `import spss` command.  It makes sense to save 
a separate Stata data set for each round because the same variable name is sometimes used for a different variable in different rounds.  

Data on female heads-of-state in Africa is available [here](female-heads-of-state.xlsx).  The data is in Excel format.  

## Cleaning Your Data

Start by creating a cleaning do file.  Record each step involved in cleaning your data in the do file, 
so that you can replicate them easily.  

The first step is to keep only the variables you need from each round of the Afrobarometer data.  The following variables 
are common to all the Afrobarometer data sets:

- `COUNTRY` is a numeric country code 
- `DATEINTR` is the date of the Afrobarometer survey interview
- `URBRUR` is an indicator for urban vs. rural locations
- `Q1` is the respondent's age
- `Q97` is the respondent's level of education
- `Q101` is the respondent's gender

You also need to keep data on our key outcomes of interest:  

