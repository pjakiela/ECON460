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
the using data set (the data set you are merging in) that do not merge, make sure that they are not the same countries.  If 
necessary, modify the `isocode` variable so that you merge as many countries as you can.

## Replicating Alesina, Giuliano, and Nunn (2013)

At this point, you should be able to replicate the first column of table III in 
Alesina, Giuliano, and Nunn (2013).  Feel free to copy the command from their 
replication files.  If you cannot generate regression results that are identical to 
the first column of Table III, review your code before proceeding.

## Extending the Analysis

The main objective of this assignment is to analyze the relationship between 
traditional plow use and legal protection of women's rights.  The WBL data contains 
a large number of variables measuring different aspects of the legal environment, 
all of which are summarized in the variable `WBL_index`.  Familiarize yourself with 
your merged data set before proceeding.  

Now write an analysis do file that produces the following:

1. A nicely-formatted, self-contained summary statistics table reporting the means, standard deviations, minima, maxima, and observation counts for the `plow` variable, the `WBL_index` variable, the additional controls from Table III, and any other variables that you will use in your analysis.
2. A horizontal bar graph (Stata command:  `graph hbar`) showing the mean of the traditional plow use variable by World Bank country region.  Make sure that the bars/regions are sorted in order of increasing or decreasing length, that you've changed the colors of the bars, and that you've labeled the horizontal axis appropriately.
3. Two histograms of `WBL_index`, one by World Bank country income categories and the other by World Bank regions (omitting the "High Income:  OECD" region from this one because it is covered in the first histogram).  Make sure that the histograms are sorted in an intuitive way within each figure, that you make good use of color, and that the figures are self-contained and label appropriately.
4. A regression table where you replicate the specifications in Columns 1 and 2 of Table III, but using `WBL_index` as the dependent variable.  Your table should be nicely formatted and labeled and entirely self-contained.
5. One additional regression table presenting some piece of additional analysis (of this data) that you find interesting.

Once you've produced these pieces of analysis, you should produce a short written brief or memo describing your analysis and your findings, and why they are interesting (particularly in relation to the results reported in the original plow paper).  Please be sure to describe each of your tables and figures in the text.  

When you complete the assignment, you will upload the pdf of your written piece (including the tables and figures), your cleaning/merging do file, and your analysis do file.





