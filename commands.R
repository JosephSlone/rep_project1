library(data.table)
library(dplyr)
dt <- data.table(read.csv("activity.csv"))


# just playing around a bit
max(dt$steps, na.rm=TRUE)
# 806
min(dt$steps, na.rm=TRUE)
# 0