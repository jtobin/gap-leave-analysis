# re: https://twitter.com/NinjaEconomics/status/734136441496707073
#
# I don't necessarily disagree with conclusion, but measurement is strange.
# This is me checking the data.

# gender pay gap data from
# http://stats.oecd.org/Index.aspx?DataSetCode=IDD
# gender -> employment -> gender wage gap
GAP_DATA = GENDER_EMP_22052016060624891.csv

# parental leave data from
# https://www.oecd.org/els/soc/PF2_1_Parental_leave_systems.pdf
LEAVE_DATA = leave_data.csv

gap_data.csv: \
		$(GAP_DATA)
	cat $< | grep 2012 | cut -d, -f2,17 > $@

figures/p0.png figures/p1.png:
	./analysis.r

all: gap_data.csv figures/p0.png
