setwd("C:/Users/Lydia/Documents/Stat159/hw02")
Advertising <- read.csv("~/Stat159/hw02/data/Advertising.csv")
TV_summary <- summary(Advertising$TV)
Sales_summary <- summary(Advertising$Sales)

sink(file ="./data/eda-output.txt")
cat("TV Summary")
cat("\n")
TV_summary
cat("\n")
cat("Sales Summary")
cat("\n")
Sales_summary
sink()

jpeg("./images/histogram-tv.png")
hist(Advertising$TV, main = "TV Advertising Histogram", xlab = "Money Spent on TV Advertising (in thousands)", ylab = "Number of Markets")
dev.off()

jpeg("./images/histogram-sales.png")
hist(Advertising$Sales, main = "Sales Histogram", xlab = "Money Spent on Sales Advertising (in thousands)", ylab = "Number of Markets")
dev.off()
