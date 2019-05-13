/// CRRC blog by Koba Turmanidze
/// Despite pessimism in population’s outlook for country, further analysis gives room for optimism 
/// April, 2019

// Source: NDI/CRRC December 2018 survey (https://caucasusbarometer.org/en/nd2018ge/codebook/)

clear all

use "NDI_2018_Dec_28.12.18.dta"

//svyset, clear

svyset psu [pweight=indwt], strata(substratum) fpc(npsuss) singleunit(certainty) || id, fpc(nhhpsu) || _n, fpc(nadhh)

*** DV = assessment of the country's direction
recode q2(1/2=1 "Wrong")(3=0 "No change")(4/5=2 "Right")(else=.), gen(dire_3)
recode q2(1/2=1 "Wrong")(-3 -2=.)(else=0 "Not wrong"), gen(dire_wrong)
recode q2(4/5=1 "Right")(-3 -2=.)(else=0 "Not right"), gen(dire_right)

*** IVs = assessment of change regarding specific issues
recode q3_1 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_job)
recode q3_2 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_poverty)
recode q3_3 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_inflation)
recode q3_4 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_pensions)
recode q3_5 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_terrint)
recode q3_6 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_health)
recode q3_7 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_educ)
recode q3_8 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_hrights)
recode q3_9 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_crime)
recode q3_10 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_felect)
recode q3_11 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_court)
recode q3_12 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_natomemb)
recode q3_13 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_frspeech)
recode q3_14 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_corru)
recode q3_15 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_eumemb)
recode q3_16 (1=1 "Wrong")(-1 2=0 "No change")(3=2 "Right")(else=.), gen(q3_media)

**
recode q3_1 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_job)
recode q3_2 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_poverty)
recode q3_3 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_inflation)
recode q3_4 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_pensions)
recode q3_5 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_terrint)
recode q3_6 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_health)
recode q3_7 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_educ)
recode q3_8 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_hrights)
recode q3_9 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_crime)
recode q3_10 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_felect)
recode q3_11 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_court)
recode q3_12 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_natomemb)
recode q3_13 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_frspeech)
recode q3_14 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_corru)
recode q3_15 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_eumemb)
recode q3_16 (3=1 "Right")(-1 1 2=0 "Not right")(else=.), gen(q3r_media)

**
recode q3_1 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_job)
recode q3_2 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_poverty)
recode q3_3 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_inflation)
recode q3_4 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_pensions)
recode q3_5 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_terrint)
recode q3_6 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_health)
recode q3_7 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_educ)
recode q3_8 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_hrights)
recode q3_9 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_crime)
recode q3_10 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_felect)
recode q3_11 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_court)
recode q3_12 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_natomemb)
recode q3_13 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_frspeech)
recode q3_14 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_corru)
recode q3_15 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_eumemb)
recode q3_16 (1=1 "Wrong")(-1 2 3=0 "Not wrong")(else=.), gen(q3w_media)

*** covariates

recode q1_8 (1=1)(-9/-3=.)(else=0), gen(q1_job)
recode q1_12 (1=1)(-9/-3=.)(else=0), gen(q1_poverty)
recode q1_14 (1=1)(-9/-3=.)(else=0), gen(q1_inflation)
recode q1_4 (1=1)(-9/-3=.)(else=0), gen(q1_pensions)
recode q1_13 (1=1)(-9/-3=.)(else=0), gen(q1_terrint)
recode q1_15 (1=1)(-9/-3=.)(else=0), gen(q1_healthc)
recode q1_18 (1=1)(-9/-3=.)(else=0), gen(q1_educ)
recode q1_11 (1=1)(-9/-3=.)(else=0), gen(q1_hrights)
recode q1_20 (1=1)(-9/-3=.)(else=0), gen(q1_crime)
recode q1_7 (1=1)(-9/-3=.)(else=0), gen(q1_felect)
recode q1_9 (1=1)(-9/-3=.)(else=0), gen(q1_court)
recode q1_3 (1=1)(-9/-3=.)(else=0), gen(q1_natomemb)
recode q1_10 (1=1)(-9/-3=.)(else=0), gen(q1_frspeech)
recode q1_1 (1=1)(-9/-3=.)(else=0), gen(q1_corru)
recode q1_19 (1=1)(-9/-3=.)(else=0), gen(q1_eumemb)
recode q1_17 (1=1)(-9/-3=.)(else=0), gen(q1_media)

recode substratum (10=1 "Tbilisi")(21/26=2 "Large urban")(31/34 51=0 "Small urban")(41/44 52=3 "Rural"), gen(settype_4)
lab var settype_4 "Settlement type"

recode ethnocode (1=0 "Not minority")(2=1 "Minority"), gen(minority)
lab var minority "Minority PSU"

recode sex (1=0 "Male")(2=1 "Female")(else=.), gen(gender)
lab var gender "Female"

recode age (18/37=2 "18-37")(38/57=1 "38-57")(58/100=0 "58 and older")(else=.), gen(agegr_3)
lab var agegr_3 "Age groups"

recode q75 (-1 1/4=0 "Less than tertiary")(5/6=1 "Tertiary")(else=.), gen(edu_2)
lab var edu_2 "Tertiary edication"

recode q78 (-7=1 "Employed")(1 2=0 "Unemployed")(3/10=2 "No labor")(else=.), gen(empl_3)
recode q78 (-7=1 "Employed")(1/10=0 "Unemployed")(else=.), gen(empl_2)
lab var empl_3 "Employment status"
lab var empl_2 "Employed"

recode t4 (-3=.)(2=0 "No")(else=1 "Yes"), gen(extra)
lab var extra "Extra people at the interview?" 

gen child1=n4-n5
recode child1 (0=0 "No")(else=1 "Yes"), gen(child)
lab var child "Childen in the household?"

recode q80_1 (1=1)(-9/-3=.)(else=0), gen(q81_1r)
recode q80_2 (1=1)(-9/-3=.)(else=0), gen(q81_2r)
recode q80_3 (1=1)(-9/-3=.)(else=0), gen(q81_3r)
recode q80_4 (1=1)(-9/-3=.)(else=0), gen(q81_4r)
recode q80_5 (1=1)(-9/-3=.)(else=0), gen(q81_5r)
recode q80_6 (1=1)(-9/-3=.)(else=0), gen(q81_6r)
recode q80_7 (1=1)(-9/-3=.)(else=0), gen(q81_7r)
recode q80_8 (1=1)(-9/-3=.)(else=0), gen(q81_8r)
recode q80_9 (1=1)(-9/-3=.)(else=0), gen(q81_9r)
recode q80_10 (1=1)(-9/-3=.)(else=0), gen(q81_10r)
egen poss=rowtotal(q81_1r-q81_10r)
lab var poss "Total possession of goods"

recode q76 (-1 5 6=1 "Never")(1/4=0 "Sometimes") (else=.), gen(intnever)
lab var intnever "Never uses the internet"

recode q38_1(-2 -1 25=0 "Nonpartisan")(1/24=1 "Partisan")(else=.), gen(pidpos_2)
lab var pidpos_2 "Party identification dummy {positive}"
recode q38_1(-2 -1 25=0 "Nonpartisan")(8=1 "GD")(6=2 "UNM") (1/5 7 9/24=3 "Other")(else=.), gen(pidpos_4)
lab var pidpos_4 "Party identification {positive}"

recode q42(-2 -1 25=0 "No party")(1/24=1 "A party")(else=.), gen(pidneg_2)
lab var pidneg_2 "Party identification dummy {negative}"
recode q42(-2 -1 25=0 "No party")(8=1 "GD")(6=2 "UNM") (1/5 7 9/24=3 "Other")(else=.), gen(pidneg_4)
lab var pidneg_4 "Party identification {negative}"

**
save "ndi_dec_18_direction.dta", replace
*******************************************************************************

*** correlates of the country's wrong direction

** base models
****************

clear all
use "ndi_dec_18_direction.dta"

local covar i.settype_4 i.minority i.gender i.edu_2 i.empl_2 i.extra i.child i.intnever c.poss c.age  

svy: logit dire_wrong `covar', or // only demography
svy: logit dire_wrong i.q3w_job i.pidneg_4 i.q1_job `covar', or // demography + issues + partisanship
svy: logit dire_wrong i.q3w_job##i.pidneg_4 i.q1_job `covar', or // demography + (issues * partisanship)

*** Graph 1. Negative assessments of issues are related to the country's negative direction
*******************************************************************************

clear all
use "ndi_dec_18_direction.dta"

local covar i.settype_4 i.minority i.gender i.edu_2 i.empl_2 i.extra i.child i.intnever c.poss c.age  

**
qui svy: logit dire_wrong i.q3w_job##i.pidneg_4 i.q1_job `covar'
qui: margins, dydx(q3w_job) vce(uncond) post
estimates store d1
qui svy: logit dire_wrong i.q3w_poverty##i.pidneg_4 i.q1_poverty `covar'
qui: margins, dydx(q3w_poverty) vce(uncond) post
estimates store d2
qui svy: logit dire_wrong i.q3w_inflation##i.pidneg_4 i.q1_inflation `covar'
qui: margins, dydx(q3w_inflation) vce(uncond) post
estimates store d3
qui svy: logit dire_wrong i.q3w_pensions##i.pidneg_4 i.q1_pensions `covar'
qui: margins, dydx(q3w_pensions) vce(uncond) post
estimates store d4
qui svy: logit dire_wrong i.q3w_terrint##i.pidneg_4 i.q1_terrint `covar'
qui: margins, dydx(q3w_terrint) vce(uncond) post
estimates store d5
qui svy: logit dire_wrong i.q3w_health##i.pidneg_4 i.q1_health `covar'
qui: margins, dydx(q3w_health) vce(uncond) post
estimates store d6
qui svy: logit dire_wrong i.q3w_educ##i.pidneg_4 i.q1_educ `covar'
qui: margins, dydx(q3w_educ) vce(uncond) post
estimates store d7
qui svy: logit dire_wrong i.q3w_hrights##i.pidneg_4 i.q1_hrights `covar'
qui: margins, dydx(q3w_hrights) vce(uncond) post
estimates store d8
qui svy: logit dire_wrong i.q3w_crime##i.pidneg_4 i.q1_crime `covar'
qui: margins, dydx(q3w_crime) vce(uncond) post
estimates store d9
qui svy: logit dire_wrong i.q3w_felect##i.pidneg_4 i.q1_felect `covar'
qui: margins, dydx(q3w_felect) vce(uncond) post
estimates store d10
qui svy: logit dire_wrong i.q3w_court##i.pidneg_4 i.q1_court `covar'
qui: margins, dydx(q3w_court) vce(uncond) post
estimates store d11
qui svy: logit dire_wrong i.q3w_natomemb##i.pidneg_4 i.q1_natomemb `covar'
qui: margins, dydx(q3w_natomemb) vce(uncond) post
estimates store d12
qui svy: logit dire_wrong i.q3w_frspeech##i.pidneg_4 i.q1_frspeech `covar'
qui: margins, dydx(q3w_frspeech) vce(uncond) post
estimates store d13
qui svy: logit dire_wrong i.q3w_corru##i.pidneg_4 i.q1_corru `covar'
qui: margins, dydx(q3w_corru) vce(uncond) post
estimates store d14
qui svy: logit dire_wrong i.q3w_eumemb##i.pidneg_4 i.q1_eumemb `covar'
qui: margins, dydx(q3w_eumemb) vce(uncond) post
estimates store d15
qui svy: logit dire_wrong i.q3w_media##i.pidneg_4 i.q1_media `covar'
qui: margins, dydx(q3w_media) vce(uncond) post
estimates store d16

**
coefplot ///
(d1, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d2, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d3, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d4, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d5, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d6, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d7, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d8, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d9, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d10, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d11, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d12, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d13, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d14, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d15, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d16, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))), ///
plotlabels() drop(_cons) ///
xscale(r(0 .4)) xlabel(0 "0" .1 "10" .2 "20" .3 "30") ///
xtitle(Effects on country's negative direction) levels(95) nobaselevels ///
order() sort(, descending) ///
coeflabels ///
(1.q3w_job="Jobs" ///
1.q3w_poverty="Poverty" ///
1.q3w_inflation="Inflation" ///
1.q3w_pensions="Persions" ///
1.q3w_terrint="Territories" ///
1.q3w_health="Health" ///
1.q3w_educ="Education" ///
1.q3w_hrights="Human rights" ///
1.q3w_crime="Crime" ///
1.q3w_felect="Fair elections" ///
1.q3w_court="Courts" ///
1.q3w_natomemb="NATO membership" ///
1.q3w_frspeech="Freedom of speech" ///
1.q3w_corru="Corruption" ///
1.q3w_eumemb="EU membership" ///
1.q3w_media="Media", ///
wrap(40) notick labcolor(black*.8) labsize(vsmall) labgap(2)) /// 
graphregion(color(white)) ///
title("Negative assessments of issues are related to the country's negative direction", color(dknavy*.9) tstyle(size(mlarge)) span) ///
subtitle("Marginal effects of logit estimates, 95% CIs", color(dknavy*.8) tstyle(size(msmall)) span) ///
legend(off) note("NDI/CRRC-Georgia, December 2018")

**
graph export "Blog_Graph_1.png", width(3000) replace
*******************************************************************************

*** Graph 2. Country's direction By Aseessment of situation regarding jobs and free speech
******************************************************************************************

clear all
use "ndi_dec_18_direction.dta"

svy: tab q3w_job dire_wrong, row
qui: proportion dire_wrong if q3w_job==0
est store notwrong
qui qui: proportion dire_wrong if q3w_job==1
est store wrong

**
coefplot (wrong, recast(bar) barwidth(0.3) color(maroon*.4) offset(-.175)) ///
(notwrong, recast(bar) barwidth(0.3) color(navy*.3) offset(.175)), ///
vertical noci rescale(100) format(%9.0f) plotregion(margin(b=0)) ///
name(job, replace) coeflabels(_prop_1="Not wrong" _prop_2="Wrong", notick labgap(2)) ///
addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(1) mlabcolor(black)) ///
ylabel(0(50)100, angle(horizontal) format(%9.0f)) ytitle(Percent) ///
xtitle(Country's direction) ///
graphregion(color(white)) ///
title("Jobs", color(dknavy*.9) tstyle(size(mlarge)) span) ///
legend(label(1 "Wrong")label(2 "Not wrong") order(1 2) pos(12) region(lcolor(white)))
graph save job.gph, replace

**
svy: tab q3w_frspeech dire_wrong, row
qui: proportion dire_wrong if q3w_frspeech==0
est store notwrong
qui: proportion dire_wrong if q3w_frspeech==1
est store wrong

**
coefplot (wrong, recast(bar) barwidth(0.3) color(maroon*.4) offset(-.175)) ///
(notwrong, recast(bar) barwidth(0.3) color(navy*.3) offset(.175)), ///
vertical noci rescale(100) format(%9.0f) plotregion(margin(b=0)) ///
name(frsp, replace) coeflabels(_prop_1="Not wrong" _prop_2="Wrong", notick labgap(2)) ///
addplot(scatter @b @at, ms(i) mlabel(@b) mlabpos(1) mlabcolor(black)) ///
ylabel(0(50)100, angle(horizontal) format(%9.0f)) ytitle(Percent) ///
xtitle(Country's direction) ///
graphregion(color(white)) ///
title("Freedom of speech", color(dknavy*.9) tstyle(size(mlarge)) span) ///
legend(off)
graph save frspeech.gph, replace

**
grc1leg2 job.gph frspeech.gph, ycommon xcommon rows(1) ///
graphregion(color(white)) ///
title("Country's direction By Aseessment of situation regarding ... (%)", color(dknavy*.9) tstyle(size(medium)) span) ///
subtitle("(NDI/CRRC-Georgia, December 2018)", color(navy*.8) tstyle(size(msmall)) span)

graph export "Blog_Graph_2.png", width(3000) replace
*******************************************************************************

** Graph 3. partisan bias? marginal effects
********************************************

clear all
use "ndi_dec_18_direction.dta"

local covar i.settype_4 i.minority i.gender i.edu_2 i.empl_2 i.extra i.child i.intnever c.poss c.age  

**
qui svy: logit dire_wrong i.q3w_job##i.pidneg_4 i.q1_job `covar'
qui: margins, dydx(q3w_job) at (pidneg_4==(1)) vce(uncond) post
estimates store d1
qui svy: logit dire_wrong i.q3w_poverty##i.pidneg_4 i.q1_poverty `covar'
qui: margins, dydx(q3w_poverty)  at (pidneg_4==(1)) vce(uncond) post
estimates store d2
qui svy: logit dire_wrong i.q3w_inflation##i.pidneg_4 i.q1_inflation `covar'
qui: margins, dydx(q3w_inflation) at (pidneg_4==(1)) vce(uncond) post
estimates store d3
qui svy: logit dire_wrong i.q3w_pensions##i.pidneg_4 i.q1_pensions `covar'
qui: margins, dydx(q3w_pensions) at (pidneg_4==(1)) vce(uncond) post
estimates store d4
qui svy: logit dire_wrong i.q3w_terrint##i.pidneg_4 i.q1_terrint `covar'
qui: margins, dydx(q3w_terrint) at (pidneg_4==(1)) vce(uncond) post
estimates store d5
qui svy: logit dire_wrong i.q3w_health##i.pidneg_4 i.q1_health `covar'
qui: margins, dydx(q3w_health) at (pidneg_4==(1)) vce(uncond) post
estimates store d6
qui svy: logit dire_wrong i.q3w_educ##i.pidneg_4 i.q1_educ `covar'
qui: margins, dydx(q3w_educ) at (pidneg_4==(1)) vce(uncond) post
estimates store d7
qui svy: logit dire_wrong i.q3w_hrights##i.pidneg_4 i.q1_hrights `covar'
qui: margins, dydx(q3w_hrights) at (pidneg_4==(1)) vce(uncond) post
estimates store d8
qui svy: logit dire_wrong i.q3w_crime##i.pidneg_4 i.q1_crime `covar'
qui: margins, dydx(q3w_crime) at (pidneg_4==(1)) vce(uncond) post
estimates store d9
qui svy: logit dire_wrong i.q3w_felect##i.pidneg_4 i.q1_felect `covar'
qui: margins, dydx(q3w_felect) at (pidneg_4==(1)) vce(uncond) post
estimates store d10
qui svy: logit dire_wrong i.q3w_court##i.pidneg_4 i.q1_court `covar'
qui: margins, dydx(q3w_court) at (pidneg_4==(1)) vce(uncond) post
estimates store d11
qui svy: logit dire_wrong i.q3w_natomemb##i.pidneg_4 i.q1_natomemb `covar'
qui: margins, dydx(q3w_natomemb) at (pidneg_4==(1)) vce(uncond) post
estimates store d12
qui svy: logit dire_wrong i.q3w_frspeech##i.pidneg_4 i.q1_frspeech `covar'
qui: margins, dydx(q3w_frspeech) at (pidneg_4==(1)) vce(uncond) post
estimates store d13
qui svy: logit dire_wrong i.q3w_corru##i.pidneg_4 i.q1_corru `covar'
qui: margins, dydx(q3w_corru) at (pidneg_4==(1)) vce(uncond) post
estimates store d14
qui svy: logit dire_wrong i.q3w_eumemb##i.pidneg_4 i.q1_eumemb `covar'
qui: margins, dydx(q3w_eumemb) at (pidneg_4==(1)) vce(uncond) post
estimates store d15
qui svy: logit dire_wrong i.q3w_media##i.pidneg_4 i.q1_media `covar'
qui: margins, dydx(q3w_media) at (pidneg_4==(1)) vce(uncond) post
estimates store d16

**
coefplot ///
(d1, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d2, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d3, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d4, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d5, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d6, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d7, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d8, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d9, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d10, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d11, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d12, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d13, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d14, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d15, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))) ///
(d16, lpatt(solid)lcol(blue)msym(d)mcol(blue)ciopts(lpatt(solid)lcol(blue)lwidth(thin))), ///
name(gd, replace) ///
plotlabels() drop(_cons) ///
xscale(r(-.1 .5)) xlabel() ///
xline(0, lcolor(orange) lwidth(thin) lpattern(dash)) ///
xtitle(Effects on country's negative direction) levels(95) nobaselevels ///
order(1.q3w_felect 1.q3w_eumemb 1.q3w_frspeech 1.q3w_natomemb 1.q3w_hrights ///
1.q3w_court 1.q3w_media 1.q3w_educ 1.q3w_crime 1.q3w_job 1.q3w_corru ///
1.q3w_pensions 1.q3w_terrint 1.q3w_health 1.q3w_poverty 1.q3w_inflation) ///
coeflabels ///
(1.q3w_job="Jobs" ///
1.q3w_poverty="Poverty" ///
1.q3w_inflation="Inflation" ///
1.q3w_pensions="Persions" ///
1.q3w_terrint="Territories" ///
1.q3w_health="Health" ///
1.q3w_educ="Education" ///
1.q3w_hrights="Human rights" ///
1.q3w_crime="Crime" ///
1.q3w_felect="Fair elections" ///
1.q3w_court="Courts" ///
1.q3w_natomemb="NATO membership" ///
1.q3w_frspeech="Freedom of speech" ///
1.q3w_corru="Corruption" ///
1.q3w_eumemb="EU membership" ///
1.q3w_media="Media", ///
wrap(40) notick labcolor(black*.8) labsize(vsmall) labgap(2)) /// 
graphregion(color(white)) ///
title("Georgian Dream", color(dknavy*.9) tstyle(size(mlarge)) span) ///
subtitle("", color(dknavy*.8) tstyle(size(msmall)) span) ///
legend(off)

**

qui svy: logit dire_wrong i.q3w_job##i.pidneg_4 i.q1_job `covar'
qui: margins, dydx(q3w_job) at (pidneg_4==(2)) vce(uncond) post
estimates store d1
qui svy: logit dire_wrong i.q3w_poverty##i.pidneg_4 i.q1_poverty `covar'
qui: margins, dydx(q3w_poverty)  at (pidneg_4==(2)) vce(uncond) post
estimates store d2
qui svy: logit dire_wrong i.q3w_inflation##i.pidneg_4 i.q1_inflation `covar'
qui: margins, dydx(q3w_inflation) at (pidneg_4==(2)) vce(uncond) post
estimates store d3
qui svy: logit dire_wrong i.q3w_pensions##i.pidneg_4 i.q1_pensions `covar'
qui: margins, dydx(q3w_pensions) at (pidneg_4==(2)) vce(uncond) post
estimates store d4
qui svy: logit dire_wrong i.q3w_terrint##i.pidneg_4 i.q1_terrint `covar'
qui: margins, dydx(q3w_terrint) at (pidneg_4==(2)) vce(uncond) post
estimates store d5
qui svy: logit dire_wrong i.q3w_health##i.pidneg_4 i.q1_health `covar'
qui: margins, dydx(q3w_health) at (pidneg_4==(2)) vce(uncond) post
estimates store d6
qui svy: logit dire_wrong i.q3w_educ##i.pidneg_4 i.q1_educ `covar'
qui: margins, dydx(q3w_educ) at (pidneg_4==(2)) vce(uncond) post
estimates store d7
qui svy: logit dire_wrong i.q3w_hrights##i.pidneg_4 i.q1_hrights `covar'
qui: margins, dydx(q3w_hrights) at (pidneg_4==(2)) vce(uncond) post
estimates store d8
qui svy: logit dire_wrong i.q3w_crime##i.pidneg_4 i.q1_crime `covar'
qui: margins, dydx(q3w_crime) at (pidneg_4==(2)) vce(uncond) post
estimates store d9
qui svy: logit dire_wrong i.q3w_felect##i.pidneg_4 i.q1_felect `covar'
qui: margins, dydx(q3w_felect) at (pidneg_4==(2)) vce(uncond) post
estimates store d10
qui svy: logit dire_wrong i.q3w_court##i.pidneg_4 i.q1_court `covar'
qui: margins, dydx(q3w_court) at (pidneg_4==(2)) vce(uncond) post
estimates store d11
qui svy: logit dire_wrong i.q3w_natomemb##i.pidneg_4 i.q1_natomemb `covar'
qui: margins, dydx(q3w_natomemb) at (pidneg_4==(2)) vce(uncond) post
estimates store d12
qui svy: logit dire_wrong i.q3w_frspeech##i.pidneg_4 i.q1_frspeech `covar'
qui: margins, dydx(q3w_frspeech) at (pidneg_4==(2)) vce(uncond) post
estimates store d13
qui svy: logit dire_wrong i.q3w_corru##i.pidneg_4 i.q1_corru `covar'
qui: margins, dydx(q3w_corru) at (pidneg_4==(2)) vce(uncond) post
estimates store d14
qui svy: logit dire_wrong i.q3w_eumemb##i.pidneg_4 i.q1_eumemb `covar'
qui: margins, dydx(q3w_eumemb) at (pidneg_4==(2)) vce(uncond) post
estimates store d15
qui svy: logit dire_wrong i.q3w_media##i.pidneg_4 i.q1_media `covar'
qui: margins, dydx(q3w_media) at (pidneg_4==(2)) vce(uncond) post
estimates store d16

coefplot ///
(d1, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d2, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d3, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d4, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d5, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d6, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d7, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d8, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d9, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d10, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d11, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d12, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d13, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d14, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d15, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))) ///
(d16, lpatt(solid)lcol(maroon*.9)msym(d)mcol(maroon*.9)ciopts(lpatt(solid)lcol(maroon*.9)lwidth(thin))), ///
name(unm, replace) ///
plotlabels() drop(_cons) ///
xscale(r(-.1 .5)) xlabel() ///
xline(0, lcolor(orange) lwidth(thin) lpattern(dash)) ///
xtitle(Effects on country's negative direction) levels(95) nobaselevels ///
order(1.q3w_felect 1.q3w_eumemb 1.q3w_frspeech 1.q3w_natomemb 1.q3w_hrights ///
1.q3w_court 1.q3w_media 1.q3w_educ 1.q3w_crime 1.q3w_job 1.q3w_corru ///
1.q3w_pensions 1.q3w_terrint 1.q3w_health 1.q3w_poverty 1.q3w_inflation) ///
coeflabels ///
(1.q3w_job="Jobs" ///
1.q3w_poverty="Poverty" ///
1.q3w_inflation="Inflation" ///
1.q3w_pensions="Persions" ///
1.q3w_terrint="Territories" ///
1.q3w_health="Health" ///
1.q3w_educ="Education" ///
1.q3w_hrights="Human rights" ///
1.q3w_crime="Crime" ///
1.q3w_felect="Fair elections" ///
1.q3w_court="Courts" ///
1.q3w_natomemb="NATO membership" ///
1.q3w_frspeech="Freedom of speech" ///
1.q3w_corru="Corruption" ///
1.q3w_eumemb="EU membership" ///
1.q3w_media="Media", ///
wrap(40) notick labcolor(black*.8) labsize(vsmall) labgap(2)) /// 
graphregion(color(white)) ///
title("United National Movement", color(dknavy*.9) tstyle(size(mlarge)) span) ///
subtitle("", color(dknavy*.8) tstyle(size(msmall)) span) ///
legend(off)

**
graph combine gd unm, graphregion(color(white)) ///
title("Assessments of issues as related to the country's direction" "By Never vote for ...", color(dknavy*.9) tstyle(size(medium)) span) ///
subtitle("Marginal effects, 95% CIs", color(navy*.8) tstyle(size(msmall)) span) ///
note("NDI/CRRC-Georgia, December 2018")

**
graph export "Blog_Graph_3.png", width(3000) replace
*******************************************************************************
