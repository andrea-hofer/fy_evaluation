# Evaluation of First Year Courses


## Description

This repository provides code to get survey data from google forms
through a dynamic scraper.

An Rmd script analyzes the data and provides a PDF that contains statistics
and written answers for all questions.

## Libraries needed

### Rstudio
library(lettercase)  
library(ggplot2)  
library(tibble)  
library(readr)  
library(knitr)  
library(dplyr)  
library(tidyr)  

### Python 3 (libraries are called in the python script)

from selenium import webdriver  
from selenium.webdriver.common.keys import Keys  
import time  
from selenium.webdriver.chrome.options import Options  
import os  

## Order of files

The files should be run in the following order:

1) Scraper: scraper_forms.ipynb
2) R Script: pdf_output.Rmd (this script calls clean_data.R script)


## Potential problems and fixes:

### Scraper:
1) Directories:
Note that the directories created in the script are made for Windows and
therefore use double slashes \\. If you run this on a different operating system,
please change accordingly.   

2) Google Authentication:
It occurred once that Google asked for additional authentication by location
after having put in username and PW. Please click on location and put in Zurich.
This only happened once and we have not been able to recreate the situation despite
trying hard (and therefore we couldn't adjust the script to deal with this issue).

3) Internet connection
The scraper has very long waiting times built in, nevertheless it still sometimes
happens (at least at the department) that it breaks down because the internet
connection is not strong enough or breaks. Please just re-run the scraper
from the beginning if this happens and make sure the connection is stable.
