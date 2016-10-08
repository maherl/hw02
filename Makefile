.PHONY: all data clean

all: ./report/report.pdf ./code/eda-output.txt ./data/regression.RData

./report/report.pdf: ./report/report.Rmd ./data/regression.RData ./images/scatterplot-tv-sales.png
	pandoc ./report/report.Rmd ./data/regression.RData ./images/scatterplot-tv-sales.png -s -o ./report/report.pdf

./code/eda-output.txt: ./code/eda-script.R ./data/Advertising.csv
	pandoc ./code/eda-script.R ./data/Advertising.csv -t rst -s -o ./data/eda-output.txt

./data/regression.RData: ./code/regression-script.R ./data/Advertising.csv
	RScript ./code/regression-script.R ./data/Advertising.csv

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o "./data/Advertising.csv"
clean:
	rm ./report/report.pdf ./report/report.html