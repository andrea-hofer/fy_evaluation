# knit_rmd2pdf
#
# this script takes an Rmd file command line argument
# and complies it to pdf using knitr
#
# Author: @lachlandeer
#

args <- commandArgs(trailingOnly = TRUE)
print(args)

rmarkdown::render(input = args[1], output_file = args[2], quiet=TRUE)
