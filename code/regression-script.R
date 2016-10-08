# ==============================================================================
# Read in Advertising.csv data set
# ==============================================================================
advertising <- read.csv(file = "data/Advertising.csv", 
                        row.names = 1)



# ==============================================================================
# Regression analysis
# ==============================================================================
# Regression object
reg <- lm(Sales ~ TV, data = advertising)
reg

# Summary
regsum <- summary(reg)
regsum

# Tables
library(xtable)
reg_table <- xtable(reg, 
                    caption = "Table 1: Summary of Regression Coefficients")

q_ind <-data.frame("Residual standard error" = c(round(regsum$sigma, digits = 2)), 
           "R^2" = c(round(regsum$r.squared, digits = 2)), 
           "F-statistic" = c(round(regsum$fstatistic, digits = 2)))
q_ind <- data.frame(t(q_ind))
q_ind <- q_ind[1]
colnames(q_ind) <- c("Value")
regsum_table <- xtable(q_ind, 
                       caption = "Table 2: Quality Indices")

# Output file
save(reg, regsum, reg_table, regsum_table, file = 'data/regression.RData')



# ==============================================================================
# Scatterplot
# ==============================================================================
library(ggplot2)
ggplot(data = advertising, aes(x = TV, y = Sales)) + 
  geom_point(color = "tomato") + 
  xlab("TV Advertising Budget (in thousands of dollars)") +
  ylab("Product Sales (in thousands of units)") + 
  geom_smooth(method = 'lm') + 
  scale_x_continuous(breaks = seq(0, 300, 50)) + 
  scale_y_continuous(breaks = seq(0, 30, 5)) + 
  geom_segment(aes(x = TV, xend = TV, y = Sales, yend = reg$fitted.values), 
               alpha = 0.2)

# Save as PNG
dev.copy(png, "images/scatterplot-tv-sales.png")
dev.off()
# Save as PDF
dev.copy(pdf, "images/scatterplot-tv-sales.pdf")
dev.off()