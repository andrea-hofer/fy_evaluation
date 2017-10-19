# This file downloads the data from google forms and saves them in a newly created input folder for windows users.

# IMPORTANT:
#       in order for the file to work, the right path to the users chromedriver needs to be manually
#       filled in on line 43, (e.g. chromedriver = 'C:/webdrivers/chromedriver')
# coding: utf-8


# Import libaries
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.chrome.options import Options
import os
import sys
import zipfile


# Save current working directory as path
path = os.getcwd()

# Creat input and output folder in current directory
#os.makedirs(path + '\\input', exist_ok=True)
#os.makedirs(path + '\\output', exist_ok=True)
input_path = path + '\\input'
output_path = path + '\\output'


# Make an input directory if it does not already exist in order to store the data from the scraper
if not os.path.exists(input_path):
    os.makedirs(input_path)

# Make an output path

if not os.path.exists(output_path):
    os.makedirs(output_path)


# Set chromedriver options so that it saves the zip file in the current directory
chromeOptions = webdriver.ChromeOptions()
prefs = {"download.default_directory" : input_path}
chromeOptions.add_experimental_option("prefs", prefs)
chromedriver = 'C:/webdrivers/chromedriver'
driver = webdriver.Chrome(executable_path = chromedriver, chrome_options = chromeOptions)


# Inputs
url = 'https://docs.google.com/forms/'
email = 'testpp4rs@gmail.com'
password = 'fyevalpp4rs'

### Login:

#driver = webdriver.Chrome('C:/webdrivers/chromedriver')
driver.get(url)
inputmail = driver.find_element_by_xpath('//*[@id="identifierId"]')
inputmail.send_keys(email)
time.sleep(10)

driver.find_element_by_xpath('//*[@id="identifierNext"]').click()


# Put in pw and continue
time.sleep(10)
inputpw = driver.find_element_by_name('password')
inputpw.send_keys(password)
time.sleep(10)

driver.find_element_by_xpath('//*[@id="passwordNext"]').click()
time.sleep(10)


# Click form I want to open
driver.find_element_by_xpath('//*[@class="docs-homescreen-grid-item-thumbnail"]').click()
time.sleep(10)

# Click on answers
driver.find_element_by_xpath('//*[@id="tJHJj"]/div[3]/div[2]/div[1]/div[2]').click()
time.sleep(10)


# click on grey thing to open choice menu
driver.find_element_by_xpath('//*[@id="ResponsesView"]/div/div[1]/div[1]/div[2]/div[2]/div/div').click()
time.sleep(15)


# Find by string and class, note the quotation marks!
driver.find_element_by_xpath("//*[@class = 'quantumWizMenuPapermenuMenuItemLabel' and contains (text(),'CSV')]").click()


# Extract zipfile into current working directory as csv file to be read into R.
time.sleep(30)
stored_path = input_path + "\\First_Year_evaluation.csv.zip"

zip_ref = zipfile.ZipFile(stored_path, 'r')
zip_ref.extractall(input_path)
zip_ref.close()


time.sleep(30)
