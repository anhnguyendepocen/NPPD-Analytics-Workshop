#--- Reading In Data -----------------------------------------------------------

# Setup
# Run the Setup.R file
source("https://bit.ly/2i8sicn")

#--- Data In Excel -------------------------------------------------------------
# Gas Prices in the Midwest
midwest <- read.csv("https://bit.ly/2hwWiQ8")
head(midwest)

str(midwest)

# Look at read.csv - wrapper for read.table
read.csv

# Help on read.table - options, etc.
?read.table

#--- Your Turn -----------------------------------------------------------------
# Have a look at the parameters of read.table (?read.table) to solve the
# following problems:

# 1. Read the first two lines of the file into an object called midwest_names



# 2. Read everything EXCEPT the first two lines into an object called midwest_data


#--- Data Cleaning -------------------------------------------------------------
# Collect gas price data into the "value" variable
values <- c(midwest_data$V3, midwest_data$V5, midwest_data$V7,
            midwest_data$V9, midwest_data$V11)

# Collect dates into the "dates" variable
# Paste year, month, and day together to get one readable date
dates <- c(paste(midwest_data$V1, midwest_data$V2, sep = "-"),
           paste(midwest_data$V1, midwest_data$V4, sep = "-"),
           paste(midwest_data$V1, midwest_data$V6, sep = "-"),
           paste(midwest_data$V1, midwest_data$V8, sep = "-"),
           paste(midwest_data$V1, midwest_data$V10, sep = "-"))

# Remove missing values
dates <- dates[!is.na(values)]
values <- values[!is.na(values)]

# Change "dates" variable to be of type "Date"
library(lubridate)
dates <- ymd(dates)

# Create a new data frame
midwest_gas <- data.frame(date = dates, price = values)
# Order the data by date
midwest_gas <- midwest_gas[with(midwest_gas, order(date)), ]

# Plot the (cleaned) data
library(ggplot2)
qplot(date, price, data = midwest_gas, geom = "line")

#--- Reading Excel Data --------------------------------------------------------
library(readxl)
# Download the excel file and save it to the current working directory
download.file(url = "https://bit.ly/2ihV8Ye",
              destfile = "midwest.xls")

midwest2 <- read_excel("midwest.xls")
# Fix name issues
names(midwest2) <- make.names(names(midwest2))
head(midwest2, 4)

#--- Foreign Package -----------------------------------------------------------
library(foreign)
?read.spss
?read.xport
?read.mtp

#--- Your Turn -----------------------------------------------------------------
# The NHANES (National Health and Nutrition Survey) publishes data in the
# SAS xport format:
# https://wwwn.cdc.gov/Nchs/Nhanes/Search/nhanes13_14.aspx

# Scroll to the bottom, choose one of the datasets (Demographics, Examination, etc.).
# Download the Data file (XPT)
# Use read.xport() to load the file into R


