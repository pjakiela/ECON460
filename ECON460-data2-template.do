
// ECON 460 DATA ASSIGNMENT 2
// ANCESTRAL CHARACTERISTICS AND WOMEN'S EQUALITY IN THE LAW

** preliminaries ---------------------------------------------------------------

clear all
set more off
set scheme s1mono

if c(username) == "pj" {
	cd "C:\Users\pj\Dropbox\ECON-460\data-assignments\data2\data"
	local mypath = "C:\Users\pj\Dropbox\ECON-460\data-assignments\data2"
}

if c(username) == "pjaki" {
	cd "C:\Users\pjaki\Dropbox\ECON-460\data-assignments\data2\data"
	local mypath = "C:\Users\pjaki\Dropbox\ECON-460\data-assignments\data2"
}


** prep WBL data ---------------------------------------------------------------

use "`mypath'\data\raw\WBL1-0-1971-2024.dta"

keep if year==2023
rename ISOcode isocode
sort isocode

save "`mypath'\data\ECON460-WBL-data.dta", replace
clear


** load ancestral characteristics data -----------------------------------------

use "`mypath'\data\ECON460-Giuliano-Nunn-data.dta"


** generate new variables ------------------------------------------------------

**** v9 monogamy
gen monogamy = v9_grp2
label var monogamy "Ancestral populatons practiced monogamy"
gen mono_missing = v9_grp1
label var mono_missing "Monogamy data missing"

**** v11 residence patterns
gen patrilocal = v11_grp2
label var patrilocal "Ancestral populatons patrilocal"
gen matrilocal = v11_grp4
label var matrilocal "Ancestral populatons matrilocal"
gen patri_missing = v11_grp1
label var patri_missing "Patrilocality data missing"

**** v39 plow use
gen plow = v9_grp4
label var plow "Ancestral populatons used the plow"
gen plow_missing = v39_grp1
label var plow_missing "Plow data missing"

**** INSERT YOUR ADDITIONAL CLEANING CODE HERE






** merge with WBL data -------------------------------------------------------------------

sort isocode
merge 1:1 isocode using "`mypath'\data\ECON460-WBL-data.dta"
drop if _m!=3


** save data -------------------------------------------------------------------

save "`mypath'\data\ECON460-YOURNAME-data2.dta", replace





