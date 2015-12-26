# Getting and Cleaning Data Course Project

## Introduction
Th R script in this repository was created for the Coursera Course: Getting and Cleaning Data, taught by Jeff Leek at Johns Hopkins University. This script will create a "tidy" dataset from the Human Activity Recognition Using Smartphone Data Set. See the [code book] (https://github.com/daileya5/R-GCD-Project/blob/master/codebook.md) for more information about this dataset. 



## Instructions
To run this script you should first clone this Github repository to your local working directory (e.g. your home directory on Mac OS X / Linux or the %UserProfile% directory on Windows 7, 8, and 10). Then run the run_analysis.R script in R. This script will download the original [Human Activity Recognition Using Smartphone Data Set] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and perform all of the necessary steps to generate a tidy dataset. 

## Steps
The specific steps to complete this task are as follows:

  1. On a Linux / Mac OS PC, open a terminal window and navigate to your R working directory. This could be your home directory, or     another directory of your choosing. 

  Note: If you are using Windows you may need to use an alternative method to clone this Github repository. See this [link] (http://www.thegeekstuff.com/2012/02/git-for-windows/) for more information. 

  2. Once you have selected the location where you want to save this repository, enter the following command:

  git clone https://github.com/daileya5/R-GCD-Project/

  This will copy all of the files in the R-GCD-Project to your local directory.

  3. Open R and enter the following command at the command prompt:

  setwd("R-GCD-Project")

  Note: This command assumes you cloned the R-GCD-Project repository to your default R working directory. You may have to alter this path slightly depending on where you cloned the Github repository. 

  4. Enter the following command at the R command prompt to run the run_analysis.R script:

  source("run_analysis.R")

  Once this script has finished running it will create the tidy.data.csv dataset, which is a tidy form of a subset of the original Human Activity Recognition Using Smartphone Data Set.


## Output
The run_analysis.R script will generate 1 file:

  tidy.data.csv: a comma separated value file that contains each variable in the original dataset that contains mean or standard deviation at the end of the variable name, averaged by subject and activity. 

To view the tidy.data file in R, use the following commands:

  data <- read.table(file="tidy.data.csv", header = TRUE, sep=",")
  
  View(data)


## Code Book

There is a code book that explains the dataset used by this script in greater detail available [here] (https://github.com/daileya5/R-GCD-Project/blob/master/codebook.md).


## Dependencies

In order to run the run_analysis.R script you need to have the following R packages installed:

plyr  # used for joining data

reshape  # used for melting data into narrow format

If you have these packages installed, the script will load them automatically. If they are not installed then the script will not work. See this [link] (http://www.statmethods.net/interface/packages.html) for more information about installing packages in R.

