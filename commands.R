library(data.table)
library(dplyr)
library(ggplot2)
dt <- data.table(read.csv("activity.csv"))

#1

dt %>% select(date, steps) %>%
    group_by(date) %>%
    summarise(nsteps = sum(steps, na.rm=FALSE)) %>%
    filter(!is.na(nsteps)) -> steps

rng = range(steps$nsteps)
ggplot(data=steps, aes(steps$nsteps)) +
    geom_histogram(breaks=seq(rng[1], rng[2], by=1000), fill="Brown") +
    xlab("Steps Per Day") +
    ylab("Total")
    ggtitle("Total Steps Taken Per Day")

mean(steps$nsteps)
median(steps$nsteps)

#2

ts <- tapply(dt$steps, dt$interval, mean, na.rm = TRUE)
plot(row.names(ts), ts, type = "l",
    xlab = "5-minute interval", ylab = "Average across all Days",
    main = "Average number of steps taken",
    col = "Blue")

interval <- which.max(ts)
names(interval)



