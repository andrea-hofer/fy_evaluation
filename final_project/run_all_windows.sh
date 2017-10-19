# run_all_windows.sh
# Contributor: Andrea Hofer, Ursina Schaede
# This file executes the phyton scraper, saves the data set and creates the PDF using the data set for Windows users.
# Expected usage:
# $ bash run_all_windows.sh


# Get data set with the python scraper
python scraper_forms_windows.py  ./input/

# Knit markdwon file that creates the final pdf with the results
R -e "rmarkdown::render('pdf_output.Rmd',output_file='./output/output.pdf')"
