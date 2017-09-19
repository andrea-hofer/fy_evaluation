# This file creates histograms for all the questions in the data set
rm(list = ls())
# Load libraries

library(ggplot2)
library(tibble)
library(readr)

library(dplyr)
library(tidyr)
library(janitor)

# Load dataset
fy_df = read_delim("./data_raw/fy_eval.csv", delim = ",")


### Try to loop over all variables with numeric answer (type 'int') to create all histograms together

# First, create dataset only with columns of type 'int':
fy_int_df = select_if(fy_df, is.integer)

# Loop over all columns to create histogram for all questions (this only displays the last histogram)
# Note: if want to print them out separately, create an empty list before and save the plots in this list (for more
# information see: https://stackoverflow.com/questions/26034177/r-saving-multiple-ggplots-using-a-for-loop)
for (i in 1:3) {
  if (is.integer(fy_df[[i]])) {
    histogram = ggplot(data = fy_df) +
      geom_bar(mapping = aes(x = fy_df[[i]])) +
      labs(x = "Possible answers ranging from 1 to 5",
           y = "Count") +
      scale_x_continuous(limits = c(1,6)) +
      ggtitle(paste(names(fy_df)[i])) +
      theme_bw()
    print(histogram)
  } 
}

# Make a list out of each column
