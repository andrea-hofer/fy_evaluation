# run_all.sh
# Contributor: Andrea Hofer, Ursina Schaede
# This file executes the phyton scraper, saves the data set and creates the PDF using the data set for Mac users
# Expected usage:
# $ bash run_all_mac.sh


## Get data set with the python scraper
python scraper_forms_mac.py  ./input/

## Knit the markdown file to create the final PDF
R -e "rmarkdown::render('pdf_output.Rmd',output_file='./output/output.pdf')"
