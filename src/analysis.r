#!/usr/local/bin/Rscript

require(dplyr)
require(ggplot2)

leave_data_file = 'data/raw/leave_data.csv'
gap_data_file   = 'data/working/gap_data.csv'

leave_data = read.csv(leave_data_file, header = T, stringsAsFactors = F)
gap_data   = read.csv(gap_data_file, header = F, stringsAsFactors = F)
names(gap_data) = c('country', 'wage_gap')

d = inner_join(leave_data, gap_data)

# reproducing the plot from the tweet
p0 = ggplot(d, aes(paid_parental_length_weeks, wage_gap, label = country)) +
  xlim(0, 160) +
  ylim(0, 50) +
  geom_point() +
  geom_text(hjust = 0, nudge_x = 0.2)

# w/a best-fit line
p1 = p0 + geom_smooth(method = 'lm', se = F)

# w/a (median) quantile regression line
p2 = p0 + geom_quantile(quantiles = 0.5)

# now including all available leave
p3 = ggplot(d, aes(total_paid_length_weeks, wage_gap, label = country)) +
  xlim(0, 180) +
  ylim(0, 60) +
  geom_point() +
  geom_text(hjust = 0, nudge_x = 0.2)

# w/a best-fit line
p4 = p3 + geom_smooth(method = 'lm', se = F)

# w/a (median) quantile regression line
p5 = p3 + geom_quantile(quantiles = 0.5)

png('figures/p0.png')
print(p1)
dev.off()

png('figures/p1.png')
print(p4)
dev.off()
