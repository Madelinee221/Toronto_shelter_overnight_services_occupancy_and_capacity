#### Preamble ####
# Purpose: Cleans the raw Toronto shlter occupancy dataset obtained in
# "01-download_data.R".
# Author: Xiaolu Ji
# Date: September 27, 2024
# Contact: madeline.ji@mail.utoronto.ca
# Pre-requisites: Run the file "01-download_data.R".

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

# This code is based on knowledge from Alexander (2023).

#### Cleaning the Dataset ####

cleaned_data <- marriage_licence_statistics %>%
  # Select relevant columns
  select(ORGANIZATION_NAME, SHELTER_GROUP, LOCATION_NAME, OVERNIGHT_SERVICE_TYPE, SERVICE_USER_COUNT, CAPACITY_TYPE, CAPACITY_ACTUAL_BED, CAPACITY_FUNDING_BED, OCCUPIED_BEDS, UNOCCUPIED_BEDS, UNAVAILABLE_BEDS, OCCUPIED_ROOMS, UNOCCUPIED_ROOMS, OCCUPANCY_RATE_BEDS, OCCUPANCY_RATE_ROOMS) %>%
  # Remove rows with missing values if any
  drop_na()

#### Saving the Cleaned Dataset ####

write_csv(cleaned_data , "/Users/madelineji/Desktop/shelter-daily-overnight-service-occupancy-and-capacity/data/cleaned_data.csv")

