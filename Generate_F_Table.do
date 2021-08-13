// Build An F Table In Stata
// Prepared by Dr. Adam Ross Nelson

set more off
clear all

set obs 50

qui {
	forvalues i = 1/10 {
		gen dfBtwn`i' = .
		format %6.5g dfBtwn`i'
	}
	
	forvalues b = 1/10 {
		forvalues w = 1/50 {
			replace dfBtwn`b' = invFtail(`b', `w', .05) in `w'
		}
	}
}

gen df_index = _n
order df_index, first

export delimited using "F_Table 5 Percent Confidence.csv", ///
datafmt replace
