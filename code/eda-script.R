# ==============================================================================
# Read in Advertising.csv data set
# ==============================================================================
advertising <- read.csv(file = "data/Advertising.csv", 
                         row.names = 1)



# ==============================================================================
# Summary statistics
# ==============================================================================
# sink output
sink(file = "data/eda-output.txt")
# Summary statistics for TV and Sales
summary(advertising[c(1, 4)])
# STOP
sink()



# ==============================================================================
# Histograms
# ==============================================================================
# TV
hist(advertising$TV, 
     xlab = "$ (in thousands)", 
     main = "TV Advertising Budgets",
     ylim = c(0,50))
# Save as PNG
dev.copy(png, "images/histogram-tv.png")
dev.off()
# Save as PDF
dev.copy(pdf, "images/histogram-tv.pdf")
dev.off()

# Sales
hist(advertising$Sales, 
     xlab = "Units of Product Sold (in thousands)",
     main = "Sales",
     ylim = c(0,80))
# Save as PNG
dev.copy(png, "images/histogram-sales.png")
dev.off()
# Save as PDF
dev.copy(pdf, "images/histogram-sales.pdf")
dev.off()