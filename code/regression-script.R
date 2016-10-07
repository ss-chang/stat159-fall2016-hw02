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

# Output file
save(reg, regsum, file = 'data/regression.RData')



# ==============================================================================
# Scatterplot
# ==============================================================================
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