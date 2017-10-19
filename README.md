# Evaluation of First Year Courses


## Description

This repository provides code to get survey data from google forms
through a dynamic scraper.

An Rmd script analyzes the data and provides a PDF that contains statistics
and written answers for all questions.

A bash script compiles the full output.   

Please download the full folder "final_project" onto your local computer.
More instructions, see below. 

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
import zipfile
import sys  

## Execution

First, you need to set the path to your chromedriver in the scraper
(scraper_forms_mac.py for Mac users and scraper_froms_windows.py for Windows
  users). This is done by copying the path into line 43 which in the end should
  look as follows: chromedriver = 'your_path_to_chromedriver'. Save the file.

Then, depending on your system now either run the run_all_mac.sh for Mac users
or the run_all_windows.sh file in the terminal by using for Mac:
\\$ bash run_all_mac.sh and for Windows: \\$ bash run_all_windows.sh. This
creates an input folder where the data set is saved in and an output folder
where the final document is saved.


## Potential problems and fixes:

1) Google Authentication:
It occurred once that Google asked for additional authentication by location
after having put in username and PW. Please click on location and put in Zurich.
This only happened once and we have not been able to recreate the situation despite
trying hard (and therefore we couldn't adjust the script to deal with this issue).

2) Internet connection
The scraper has very long waiting times built in, nevertheless it still sometimes
happens (at least at the department) that it breaks down because the internet
connection is not strong enough or breaks. Please just re-run the scraper
from the beginning if this happens and make sure the connection is stable.
Use a cable for internet if possible. It broke down a thousand times in the
department just because of poor connection.

3) The whole execution takes a while, so please be patient and do not interrupt
 it if you feel it takes too long. It will get there.

4) The terminal will throw some R warning messages which should only refer to
the knitr compiling process, they are not fatal.  
