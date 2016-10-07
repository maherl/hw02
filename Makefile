.PHONY: all data clean
all: ./report/report.pdf ./code/eda-output.txt ./data/regression.RData
./report/report.pdf: ./report/report.Rmd ./data/regression.RData ./images/scatterplot-tv-sales.png
	cat ./report/report.Rmd ./data/regression.RData ./images/scatterplot-tv-sales.png > ./report/report.pdf
./code/eda-output.txt: ./code/eda-script.R ./data/Advertising.csv
	cat ./code/eda-script.R ./data/Advertising.csv > ./data/eda-output.txt
./data/regression.RData: ./code/regression-script.R ./data/Advertising.csv
	cat ./code/regression-script.R ./data/Advertising.csv > ./data/regression.RData
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o "./data/Advertising.csv"
clean:
	rm ./report/report.pdf ./report/report.html