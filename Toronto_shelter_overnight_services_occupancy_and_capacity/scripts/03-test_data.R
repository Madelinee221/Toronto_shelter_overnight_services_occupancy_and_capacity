#### Preamble ####
# Purpose: Runs tests on the cleaned dataset to check the validity
# of the entries.
# Author: Xiaolu Ji
# Date: September 27, 2024
# Contact: madeline.ji@mail.utoronto.ca
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R".

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

#### Testing the Cleaned Dataset ####

# This code was adapted from Alexander (2023).
# Note that only the tests from "00-simulate_data.R" that are applicable to this
# cleaned dataset will be performed.

# Loading the cleaned dataset
shelter_cleaned_data <- read_csv("/Users/madelineji/Desktop/shelter-daily-overnight-service-occupancy-and-capacity/data/02-cleaned_data.csv")

# Running the tests on the cleaned dataset

# Checking the class of some of the columns

shelter_cleaned_data$`SHELTER_GROUP` |> class() == "character"

shelter_cleaned_data$`ORGANIZATION_NAME` |> class() == "character"

shelter_cleaned_data$`CAPACITY_TYPE` |> class() == "character"

# Checking that the minimum value in the SERVICE_USER_COUNT column is at least 1
shelter_cleaned_data$SERVICE_USER_COUNT |> min() >= 1

# Checking that the only two capacity types present are Room Based Capacity and Bed Based Capacity.
shelter_cleaned_data$`CAPACITY_TYPE` |>
  unique() |>
  sort() == sort(c("Room Based Capacity", "Bed Based Capacity"))

# Checking that only two capacity types are present
shelter_cleaned_data$`CAPACITY_TYPE` |>
  unique() |>
  length() == 2
