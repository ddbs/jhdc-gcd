#jhds-gcd

Course project repo for the Johns Hopkins' Getting and Cleaning Data course [getdata-031], part of the Data Science Specialization at Coursera.

The purpose of this project was to demonstrate the ability to collect, work with, and clean a data set. The goal was to prepare tidy data to be used for later analysis.

### Files

The project contains 3 files:

* `readme.md` this file
* `codebook.md` document describing the variables, the data, and cleanup transformations
* `run_analysis.R` the script


### Source data

The data came from the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

See `codebook.md` for details.


### Script

The script downloads and extracts the data, performs the analysis required in the project and outputs a file named `uci_har_means_tidy.txt`.

To run the script, copy the file `run_analysis.R` to a directory of your choosing, configure the working directory in the script and then run

    source("run_analysis.R")


### Requirements

* R, with packages *dplyr* and *reshape2* installed.
* RStudio (optional)

Tested **only** on Linux Mint 17.1 x64, running R version 3.2.2.
