# Data Analysis Assignment 3

_Data Assignment 3 is due October 20._

## Overview

For this assignment, we will be using Rounds 5, 6, 7, and 8 of the [Afrobarometer](https://www.afrobarometer.org/) Surveys.  The Afrobarometer 
contains information on political attitudes, values, and beliefs from representative population samples in 34 African countries.  We will 
combine the Afrobarometer data with information about female heads-of-state in Africa to estimate the impact of female leaders on gender 
attitudes and other outcomes in a two-way fixed effects framework.

## Getting Your Data

You can download the Afrobarometer [here](https://www.afrobarometer.org/data/merged-data/).  There is a single merged file 
for each round (containing data from all the countries included in that round).  You need to download the data for Rounds 5, 6, 
7, and 8.  The data is in SPSS format, but you can convert it to Stata format using Stata's `import spss` command.  Converting the data 
from SPSS to .dta format is time-consuming, so I recommend only doing this once.  It makes sense to save a separate Stata data set 
for each round because the same variable names are sometimes used for different variables in different rounds.  

Data on female heads of state in Africa is available [here](female-heads-of-state-africa-2024.xlsx).  The data is in Excel format.  

## Cleaning Your Data

Start by creating a cleaning do file that is separate from the do file that converts the raw SPSS files into .dta format. Record 
each step involved in cleaning your data in the do file(s), so that you can replicate the entire process easily.  

Keep only the variables you need from each round of the Afrobarometer data.  The following variables 
are common to all the Afrobarometer data sets:

- `COUNTRY` is a numeric country code 
- `DATEINTR` is the date of the Afrobarometer survey interview
- `URBRUR` is an indicator for urban vs. rural locations
- `Q1` is the respondent's age
- `Q101` is the respondent's gender

Labels sometimes change across survey rounds, so I recommend using Stata's `decode` command 
to convert labeled numeric variables into string variables containing the text of the labels. You can then 
generate the numeric variables needed for analysis after combinging all of the data sets.

In addition to the independent variables listed above, you also need to keep data on key outcomes of interest.  In Rounds 5, 6, and 7, respondents 
were asked whether they agreed more with the statement 

> Men make better political leaders than women, and should be elected rather than women.  

or the statement  

> Women should have the same chance of being elected to political office as men.  

Responses to this question appear as variable `Q22` in Round 5, as `Q18` in Round 6, 
and as `Q16` in Round 7.  You will use this variable to estimate the impact of female 
heads of state on gender attitudes (specifically support for female political leaders).  

The surveys also contain information about trust in the head of state (`Q59A` in Round 5, `Q52A` in Round 6, 
`Q43A` in Round 7, and `Q41A` in Round 8).  From these, you can construct a measure of trust in the 
head of state (you can decide how to code it).

In addition to your analysis of political attitudes (i.e. support for female political leaders and trust in 
the head of state), you need to choose one additional set of outcomes to analyze.  Some suggestions include:

- The presence of security forces as measured by the variables `EA_SEC_A` (police), `EA_SEC_B` (army), and `EA_SEC_C` (roadblocks).  These variables can be analyzed individually or converted into an index.
- The provision of health and education facilities, as measured by the variables `EA_FAC_B` (schools) and `EA_FAC_D` (health clinics).  These variables can be used to test the hypothesis (discussed [here](https://www.bbc.com/news/articles/ce3z263453lo)) that female politicians prioritize the provision of social services.
- Beliefs about the economic situation in the country and the prospects for the future (use `lookfor economic` to see a list of these variables).
- Other Afrobarometer outcomes of your choice.

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

Your summary statistics table should include data on all the variables used in your analysis.  It 
should be nicely formatted (that goes without saying at this point).

Your main regression table should report estimates of the causal impact of having a female 
head-of-state on beliefs about women politicians.  In addition to the independent variable of 
interest, you should include country and year fixed effects and cluster your standard errors 
at the country level.  You should also control for age and educational attainment.  Column 1 
should look at the entire sample, Columns 2 and 3 should show separate results for men and women, 
and Columns 4 and 5 should show separate results for urban and rural areas.  

Your third table should include a falsification test:  you should look at the "impact" of 
having a female head-of-state on respondent gender, age, educational attainment, and 
rural or urban residence in a two-way fixed effects framework (controlling for year and 
country fixed  effects).

Your fourth table will look at a different falsification test:  does having a female head-of-state 
one year in the future impact gender attitudes?  To explore this hypothesis, you need to create a 
dummy for having a female head-of-state next year (i.e. in the year after the survey).  Regress 
gender attitudes on this variable, controlling for country and year fixed effects.

## Presentation

You should present your results in a 3 to five page note (i.e. a mini-paper), as you have for 
your other assignments.  

Your note should begin with an **Introduction**.  Motivate your analysis in reference to the research 
question.  Do not begin with a narrative opening sentence like "For this assignment, I decided 
to look at..."  In your first sentence, explain why the analysis you are about to present is of interest to an economist 
studying gender.  Then use the remainder of your introductory paragraph to explain what you will do, and 
why you think your results are important.

A **Data** section should come next.  Describe the data sets used in your analysis, and present your summary 
statistics.  How do country-years with a female head-of-state differ from the rest of the sample?

The rest of your note should describe your **Analysis**.  Present your results.  Devote at least a paragraph 
to each table of results.  Explain the regression specifications that you use.  Discuss your coefficient estimates 
and their level of statistical significance, and summarize the main conclusions from each table.


