# Data Analysis Assignment 3

_Data Assignment 3 is due ???_

## Overview

For this assignment, we will be using Rounds 5, 6, and 7 of the [Afrobarometer](https://www.afrobarometer.org/) Surveys.  The Afrobarometer 
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

You also need to keep data on our key outcomes of interest.  In each round, respondents 
were asked whether they agreed more with the statement 

> Men make better political leaders than women, and should be elected rather than women.  

or the statement  

> Women should have the same chance of being elected to political office as men.  

Responses to this question appear as variable `Q22` in Round 5, as `Q18` in Round 6, 
and as `Q16` in Round 7.

To build your combined data set, keep only the variables you need from each round and then use Stata's `append` 
command to put them together.  Then familiarize yourself with the variables in your combined data set.  Generate 
new, clean variables for use in your analysis - setting any variables to missing as needed (for example, if someone 
answers "Don't Know").  

The variable `DATEINTR` is in Stata's date format, which can be a challenge (though there is plenty of online 
documentation).  To create numeric variables for the month and the year in which a survey interview took place, 
use the code
```
gen year = year(dofc(DATE))
gen month = month(dofc(DATE))
```

To generate a dummy variable for interviews that occured when a female head-of-state was in power, you might want 
to merge in the data from the spreadsheet on female leaders.  Or, you might just want to code this variable by 
hand, since the number of female leaders is small.  To do this, you will need to use Stata's date format 
(again).  Here is how I would code up a dummy variable for observations in Malawi during the period when 
Joyce Banda was the president:
```
gen joycebanda = 0
label var joycebanda "Joyce Banda was president"
replace joycebanda = 1 if (country=="Malawi" & dofc(DATE)>td(7apr2012) & dofc(DATE)<td(31may2014))
```
You can extend this code to instead indicate whether any female leader was in power.

## Analysis

Your analysis should include the following:

1. A summary statistics table
2. A regression table
3. A falsification test using your main specification, but with different outcome variables
4. A falsification test using an alternative definition of treatment

Your main regression table should report estimates of the causal impact of having a female 
head-of-state on beliefs about women politicians.  Define 

## Presentation

You should present your results in a 3 to five page note (i.e. a mini-paper), as you have for 
your other assignments.  

Your note should begin with an Introduction.  Motivate your analysis in reference to the research 
question.  Do not begin with a narrative opening sentence like "For this assignment, I decided 
to look at..."  In your first sentence, explain why the analysis you are about to present is of interest to an economist 
studying gender.  Then use the remainder of your introductory paragraph to explain what you will do, and 
why you think your results are important.

The next section 


