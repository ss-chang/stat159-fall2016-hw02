all: report.pdf eda-output.txt regression.RData

.PHONY: all data/Advertising.csv clean 

data/Advertising.csv : 
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv >> data/Advertiing.csv

report.pdf: report.Rmd regression.RData scatterplot-tv-sales.png
	cd report; pandoc report.Rmd -s -o report.pdf

regression.RData: regression-script.R Advertising.csv
	cd code; Rscript data/regression-script.R

eda-output.txt: eda-script.R Advertising.csv
	cd code; Rscript eda-script.R

clean:
	rm -f report/report.pdf
