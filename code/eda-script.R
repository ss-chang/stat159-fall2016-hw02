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
# Save as PNG
png("images/histogram-tv.png")
tv_hist <- hist(advertising$TV, 
                xlab = "$ (in thousands)", 
                main = "TV Advertising Budgets",
                ylim = c(0,50))
dev.off()

# Save as PDF
pdf("images/histogram-tv.pdf")
tv_hist <- hist(advertising$TV, 
                xlab = "$ (in thousands)", 
                main = "TV Advertising Budgets",
                ylim = c(0,50))
dev.off()

# Sales
# Save as PNG
png("images/histogram-sales.png")
hist(advertising$Sales, 
     xlab = "Units of Product Sold (in thousands)",
     main = "Sales",
     ylim = c(0,80))
dev.off()

# Save as PDF
pdf("images/histogram-sales.pdf")
hist(advertising$Sales, 
     xlab = "Units of Product Sold (in thousands)",
     main = "Sales",
     ylim = c(0,80))
dev.off()