# Data Analysis Assignment 2

_Data Assignment 2 is due by 11:00 PM on October 7._

## Overview

For this assignment, we will be replicating and extending the analysis presented 
in Alberto Alesina, Paola Giuliano, and Nathan Nunn's paper 
[On the Origins of Gender Roles:  Women and the Plough](https://academic.oup.com/qje/article/128/2/469/1943509).  To do this, 
we will combine the cross-country data from the authors' replication files with 
the World Bank's [Women, Business, and the Law](https://wbl.worldbank.org/en/wbl) database.  This will allow us 
to explore the association between traditional use of the plow in agriculture and 
legal protection of women's rights.  

## Getting Your Data

Replication files for Alesina, Giuliano, and Nunn's paper on the plow are available from 
[Professor Nunn's website](https://nathannunn.arts.ubc.ca/data/).  You'll be using the 
cross-country data file, and you should also extract their do file from the zipped folder.  

The second data set is the World Bank's [Women, Business, and the Law (WBL) database](https://wbl.worldbank.org/en/wbl-data), 
which contains information on legal protections for women in 190 countries.  You can download the data in Stata format, 
or as an Excel spreadsheet if you prefer.

## Cleaning Your Data

Start by creating a cleaning do file.  Record each step involved in cleaning your data in the do file, 
so that you can replicate them easily.  

The WBL data set tracks legal changes over time, so it contains data for every year from 1970 through 2021.  For our main analysis, 
we'll be using data for 2015.  Before merging the WBL and plough data sets together, drop the other years.

The variable `economy` contains (official World Bank) country names, and the variable `wbcodev2` contains the three-digit 
isocode for each country.  To merge the WBL data with the plow data, you will need to create a new variable called 
`isocode` that contains these codes, and you will also need to sort your data by `isocode`.  Be sure that you save 
your sorted WBL data using a new file name, so that you do not erase your raw data in the process.

After saving the sorted WBL data from 2015, clear that data set from Stata and take a look at the cross-country data 
from the plow paper.  This data set already contains an `isocode` variable, but you will still need to sort the data set 
by `isocode` before merging the two data sets together.  The name of the country is listed in the `country` variable.  

Use the `merge` command to merge the two data sets together.  How many observations merge successfully?  If there are 
both observations in the master data set (the one that you are starting with) that do not merge and observations in 
the using data set (the data set you are mergine in) that do not merge, make sure that they are not the same countries.  If 
necessary, modify the `isocode` variable so that you merge as many countries as you can.

## Analysis



