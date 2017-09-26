library(lettercase)
library(ggplot2)
library(tibble)
library(readr)

library(dplyr)
library(tidyr)
library(janitor)

## Replace special characters: 
# 1. Replace \n as it cannot be printed out by print
## @knitr replace_linebreak
fy_df = data.frame(lapply(fy_df, gsub, pattern = "\n\n", replacement = " "), check.names = FALSE,  stringsAsFactors = FALSE)

# 2. Problem: Now all the columns are strings and we need to convert the number ones back to integers and the precentages as well:
# First, I deal with the percentage signs by replacing the percentage values by numbers from 1 to 4:
## @knitr replace_percentage
for (i in 2:328) {
  for (j in 1:15) {
    if (is.na(fy_df[j,i])) next
    else if (fy_df[j,i]== "0-25%") {
      fy_df[j,i] = 1
    } else if (fy_df[j,i] == "25-50%") {
      fy_df[j,i] = 2
    } else if (fy_df[j,i] == "50-75%") {
      fy_df[j,i] = 3
    } else if (fy_df[j,i] == "75-100%") {
      fy_df[j,i] = 4
    }
  }
}
## @knitr replace_text
# Overwrite columns that have Agree instead of 4:
for (i in 2:328) {
  for (j in 1:15) {
    if (is.na(fy_df[j,i])) next
    else if (fy_df[j,i]== "Strongly agree") {
      fy_df[j,i] = 5
    } else if (fy_df[j,i] == "Agree") {
      fy_df[j,i] = 4
    } else if (fy_df[j,i] == "Neutral") {
      fy_df[j,i] = 3
    } else if (fy_df[j,i] == "Disagree") {
      fy_df[j,i] = 2
    } else if (fy_df[j,i] == "Strongly disagree") {
      fy_df[j,i] = 1
    }
  }
}

# Fix weird convertion of the word 'didn't' in column names:
## @knitr fix_column_names
for (i in 2:328) {
  names(fy_df)[i] = gsub("<80><99>", "'", names(fy_df)[i])
}

  

# Next, I will convert columns that only include numbers back to type integer:
# We will loop through all columns and check whether there is at least one letter, if there is not, it will be  
# converted to integer
# This is done by checking for each cell whether there is a letter and if there is, TRUE is added to the vector locigal for this cell
# Once we went through all the cells of one column, the vector logic is added up and if there was at least one letter, there will be at least one TRUE which will make the sum greater or equal to 1
# So if the sum is zero, meaning there were no letters in this column, the column is made integer
## @knitr correct_column_type
logic = c()
sum = c()
for (i in 2:328) {
  for (j in 1:15) {
    logic[j] = grepl('[a-zA-Z]+', fy_df[[j,i]]) # check if a cell contains a letter and save the result in logic
  }
  sum[i] = sum(logic)
  if (sum[i] > 0) {                             # if the sum is larger than 0 there was at least one TRUE,                                                          therefore at least one letter
    fy_df[[i]] = as.character(fy_df[[i]])
  } else {
    fy_df[[i]] = as.integer(as.character(fy_df[[i]]))
  }
}
