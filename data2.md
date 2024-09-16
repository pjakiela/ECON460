# Data Analysis Assignment 2

_Data Assignment 2 is due by 11:00 PM on 29._

## Overview

For this assignment, you will be exploring the role of ancestral characteristics in explaining women's legal equality in the present.  To do this, 
you will combine data from the Ethnographic Atlas with the World Bank's 
[Women, Business, and the Law](https://wbl.worldbank.org/en/wbl) database.  The [Ethnographic Atlas](https://d-place.org/contributions/EA) 
characterizes the characteristics of 1,291 pre-industrial societies; it was compiled by the antrhopologist George Murdock, who attempted 
to systematize the enormous amount of information recorded by ethnographers doing field work in traditional communities.  [Paola Giuliano](https://www.anderson.ucla.edu/faculty-and-research/global-economics-and-management/faculty/giuliano) and 
[Nathan Nunn](https://nathannunn.arts.ubc.ca/) have used the Ethnographic Atlas to construct a data set mapping current populations to 
the attributes of the pre-industrial societies of their ancestors.  

## Getting and Cleaning Your Data

We will be using [this data set](ECON460-Giuliano-Nunn-data.dta), which is a subset of the country-level data included in 
Professor Giuliano and Professor Nunn's ancestral characteristics data.  We are only going to be working with 12 of the variables from 
the Ethnographic Atlas:  those measuring monogamy, matrilocality and patrilocality, major crops, dieties, plows use, domestic animals, dairy production, 
sex segregation in the manufacture of cloth, sex segregation in the production of pottery, sex segregation in agriculture, inheritance systems, and 
norms surrounding premarital sex.  Information on these 12 Ethnologue variables and their coding is available here.  The do file 
[ECON460-data2-template.do] includes code that cleans three of these variables (on monogamy, matrilocality and patrilocality, and use of the plow), 
aggregating variables from the Giuliano and Nunn data set into a smaller set of variables to be used in the analysis.  In addition to these three 
attributes of ancestral populations, you should pick two additional variables from the Giuliano and Nunn data that you will clean and include in 
your analysis.

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





