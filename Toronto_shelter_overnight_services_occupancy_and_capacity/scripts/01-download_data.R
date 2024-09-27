#### Preamble ####
# Purpose: Downloads the data from the opendatatoronto package (Gelfand 2022)
# and saves the dataset for use in the main paper.
# Author: Xiaolu Ji
# Date: September 27, 2024
# Contact: madeline.ji@mail.utoronto.ca
# Pre-requisites: Install the opendatatoronto (Gelfand 2022) and
# tidyverse (Wickham et al. 2019) packages.

#### Loading Packages ####

# install.packages("opendatatoronto")
# install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

#### Downloading the Dataset ####

# Download the .csv dataset
marriage_licence_statistics <- marriage_licence_resources[2,] %>%
  get_resource()

#### Saving the Dataset ####

marriage_licence_statistics
write_csv(marriage_licence_statistics,"/Users/madelineji/Desktop/shelter-daily-overnight-service-occupancy-and-capacity/data.csv")
