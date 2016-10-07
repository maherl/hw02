setwd("C:/Users/Lydia/Documents/Stat159/hw02")
Advertising <- read.csv("~/Stat159/hw02/data/Advertising.csv")
library("xtable")

regression_object <-lm(Sales~TV, data = Advertising)
jpeg("./images/scatterplot-tv-sales.png")
plot(x = Advertising$TV, y = Advertising$Sales, xlab = "TV", ylab = "Sales", pch = 20, col = "red")
abline(reg = regression_object, col = "blue")
pre <- predict(regression_object)
segments(x = Advertising$TV, y = Advertising$Sales, x1 = Advertising$TV, y1 = pre, col = "light blue")
dev.off()

pdf("./images/scatterplot-tv-sales.pdf")
plot(x = Advertising$TV, y = Advertising$Sales, xlab = "TV", ylab = "Sales", pch = 20, col = "red")
abline(reg = regression_object, col = "blue")
pre <- predict(regression_object)
segments(x = Advertising$TV, y = Advertising$Sales, x1 = Advertising$TV, y1 = pre, col = "light blue")
dev.off()

reg_summary <-summary(regression_object)
reg_coefficients <-reg_summary$coefficients
reg_sigma <- reg_summary$sigma
reg_r2 <- reg_summary$r.squared
reg_f_stat <- reg_summary$fstatistic[1]

save(reg_coefficients, 
     reg_sigma,
     reg_r2,
     reg_f_stat,
     file = "./data/regression.RData")
