# Gender Wage Gap vs Paid Parental Leave

I noticed [this
tweet](https://twitter.com/NinjaEconomics/status/734136441496707073) earlier
today.  While I didn't think the conclusion was fantastically controversial, a
couple of things jumped out at me:

* I know New Zealand offers some paid leave after the birth of a child.
* I know Canada offers 52 weeks of paid leave after the birth of a child.

On the graph shown in the tweet, New Zealand is displayed as offering no paid
parental leave, and Canada is displayed as offering less than 20 weeks of paid
parental leave.

The discrepancy piqued my curiosity so I did the ~~stupid, time-wasting~~
responsible thing and checked out the data.

## The Data

The chart listed its data sources, which was great.  I was quickly able to find
the data.

Gender wage gap data can easily be collected from [the OECD.Stat
database](http://stats.oecd.org/Index.aspx?DataSetCode=IDD).  You can get it by
just following the link trail of gender -> employment -> gender wage gap from
that URL.  I'm not sure what data they used for the chart, so I just chose 2012
as it looked to be a reasonably complete year.

You can find the exported CSV in this repo as
*GENDER_EMP_22052016060624891.csv*.  A touched-up version exists in
*gap_data.csv*, and the recipe to create that file are in the attached
Makefile.

Parental leave data can be found in [this OECD PDF I
found](https://www.oecd.org/els/soc/PF2_1_Parental_leave_systems.pdf).  I
couldn't easily find any CSV data or whatnot so I just copied and pasted the
data and touched it up a bit manually.

One thing to note about the paid parental leave data used by the chart is that
it seems like kind of an odd metric.  The definition of paid parental leave is
as follows:

> **Parental leave**: employment-protected leave of absence for employed parents,
> which is often supplementary to specific maternity and paternity leave periods,
> and frequently, but not in all countries, follows the period of maternity
> leave. Entitlement to the parental leave period is often individual (i.e. each
> parent has their own entitlement) while entitlement to public income support is
> often family-based, so that in general only one parent claims such income
> support at any one time (except for a short period after childbirth). In some
> countries parental leave is generally a sharable family entitlement but with
> certain periods reserved for use by the mother or father, while in others (such
> as Austria and Germany) ‘bonus’ paid weeks are offered if both parents use a
> certain portion of the family entitlement. Assuming that the family wishes to
> maximize the total length of leave on offer, this implies that a certain number
> of weeks are effectively ‘reserved’ for fathers.

In the chart, the data is described as "paid parental and home care leave
available to mothers".  It's "parental leave and subsequent periods of paid
home care leave to care for young children".

Anyway the reason it seems like an odd metric is that it completely disregards
paid maternity leave.  For example, New Zealand offered 16 weeks of paid
maternity leave in 2015 (and now happens to offer 18 weeks, but anyway), and
Canada offered 17 weeks of paid maternity leave.  These weeks are completely
disregarded in the chart, and that seems like a particularly egregious chunk
of data to omit.  In the case of the UK, for example, paid maternity leave
constitutes 39 weeks, while paid parental leave constitutes 0.

Additionally, there are some important data points omitted from the chart, e.g.
Finland (143 weeks of paid parental leave), Slovakia (130 weeks of paid
parental leave), etc.  They may have been considered outliers or something in
the analysis, but it seems silly to disregard them here.

There are some discrepancies between the data I've found and that in the chart.
The chart lists full-time workers aged 30-34, and I haven't spotted that same
clarification in any of the data I've used.

## My Quick Analysis

I didn't put much work into this - I just wanted to see what was up with the
chart, and how a quick analysis performed on my own, with comparable data,
would measure up.  You can see what I did in the *analysis.r* file.  It's just
a couple of plots that I'll leave here, without comment.

**Feel free to fork and improve the analysis if you think my basic one is
lacking, or if you spot any errors**.

First, the same chart from the tweet:

![gap vs paid parental leave](https://github.com/jtobin/gap-leave-analysis/raw/master/figures/p0.png)

And then, wage gap data vs *total* parental leave:

![gap vs total parental leave](https://github.com/jtobin/gap-leave-analysis/raw/master/figures/p1.png)

