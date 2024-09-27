#### Preamble ####
# Purpose: Generates a simulated version of the Toronto healthcare outbreaks
# dataset from this analysis and uses tests to ensure that the simulated data
# is reasonable and realistic.
# Author: Xiaolu Ji
# Date: September 27, 2024
# Contact: madeline.ji@mail.utoronto.ca
# Pre-requisites: Install the janitor (Firke 2023) and tidyverse
# (Wickham et al. 2019) packages.

#### Loading Packages ####

#install.packages("janitor")
#install.packages("tidyverse")
library(janitor)
library(tidyverse)

#### Data Simulation ####

set.seed(123)

# This code was adapted from Alexander (2023).

# Create a dataframe with the desired columns
shelter_data <- data.frame(
  OCCUPANCY_DATE = rep(as.Date("2023-01-01"), 10),
  ORGANIZATION_ID = c(rep("COSTI Immigrant Services", 6), rep("Christie Ossington Neighbourhood Centre", 4)),
  ORGANIZATION_NAME = c(rep("COSTI Immigrant Services", 6), rep("Christie Ossington Neighbourhood Centre", 4)),
  SHELTER_ID = c(rep(40, 6), rep(22, 4)),
  SHELTER_GROUP = c(rep("COSTI Reception Centre", 6), rep("Christie Ossington Men's Hostel", 4)),
  LOCATION_ID = c(1320, 1320, 1051, 1114, 1114, 1160, 1172, 1029, 1102, 1052),
  LOCATION_NAME = c("COSTI Hotel Program Dixon", "COSTI Hotel Program Dixon", "COSTI Reception Centre", "COSTI Uptown Hotel Program", "COSTI Uptown Hotel Program", "CONC Etobicoke Hotel Program", "CONC West End Hotel Program", "CONC Men's Shelter Lansdowne Ave", "CONC Men's Shelter Bloor St W", "Christie Refugee Welcome Centre"),
  LOCATION_ADDRESS = c("640 Dixon Rd.", "640 Dixon Rd.", "100 Lippincott St", "55 Hallcrown Pl", "55 Hallcrown Pl", "445 Rexdale Blvd", "14 Roncesvalles Ave", "973 Lansdowne Ave", "850 Bloor St W", "43 Christie St"),
  LOCATION_POSTAL_CODE = c("M9W 1J1", "M9W 1J1", "M5S 2P1", "M2J 4R1", "M2J 4R1", "M9W 6P8", "M6R 2K3", "M6H 3Z5", "M6G 1M2", "M6G 3B1"),
  LOCATION_CITY = c(rep("Toronto", 8), rep("North York", 2), "Etobicoke"),
  LOCATION_PROVINCE = rep("ON", 10),
  PROGRAM_ID = c(16892, 16891, 12251, 15372, 13751, 16111, 15711, 12011, 13611, 12233),
  PROGRAM_NAME = c("COSTI - Hotel Program - Dixon", "COSTI - Hotel Program - Dixon (Refugee Singles)", "COSTI Reception Centre CITY Program", "COSTI Uptown Hotel COVID-19 - Family Program", "COSTI Uptown Hotel Family Program", "CONC Etobicoke Hotel Program - Mixed Adult", "CONC Men's Hotel Program", "Christie Ossington Men's Hostel", "Christie Ossington Men's Hostel South", "Christie Refugee Welcome Centre - Settlement and Support"),
  SECTOR = c("Families", "Mixed Adult", "Mixed Adult", "Families", "Families", "Mixed Adult", "Men", "Men", "Men", "Families"),
  PROGRAM_MODEL = rep("Emergency", 10),
  OVERNIGHT_SERVICE_TYPE = c(rep("Motel/Hotel Shelter", 6), rep("Shelter", 4)),
  PROGRAM_AREA = c(rep("Temporary Refugee Response", 4), "Base Program - Refugee", "COVID-19 Response", "COVID-19 Response", rep("Base Shelter and Overnight Services System", 2), "Base Program - Refugee"),
  SERVICE_USER_COUNT = c(rep("Temporary Refugee Response", 4), "Refugee", "COVID-19 Response", "COVID-19 Response", rep("Base Shelter and Overnight Services System", 2), "Refugee"),
  CAPACITY_TYPE = c(rep("Room Based Capacity", 6), rep("Bed Based Capacity", 4)),
  CAPACITY_ACTUAL_BED = c(614, 111, 8, 249, 462, 147, 39, 39, 18, 66),
  CAPACITY_FUNDING_BED = c(NA, NA, 8, NA, NA, NA, 39, 39, 18, NA),
  OCCUPIED_BEDS = c(148, 56, 8, 76, 148, 142, 39, 39, 18, 27),
  UNOCCUPIED_BEDS = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
  UNAVAILABLE_BEDS = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  OCCUPIED_ROOMS = c(148, 56, 76, 148, 142, 39, NA, NA, NA, NA),
  UNOCCUPIED_ROOMS = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  UNAVAILABLE_ROOMS = c(2, 0, NA, 7, 0, 10, 2, NA, NA, 2),
  OCCUPANCY_RATE_BEDS = c(100, 100, 100, 100, 100, 100, 100, 100, 100, 96.43),
  OCCUPANCY_RATE_ROOMS = c(100, 100, 100, 100, 100, 100, NA, NA, NA, NA)
)

# Print the dataset
print(shelter_data)

#### Testing the Simulated Dataset ####

# This code was adapted from Alexander (2023).

# Checking the class of some of the columns

simulated_shelter_data$`SHELTER_GROUP` |> class() == "character"

simulated_shelter_data$`ORGANIZATION_NAME` |> class() == "character"

simulated_shelter_data$`CAPACITY_TYPE` |> class() == "character"

# Checking that the minimum value in the ID column is at least 1
simulated_shelter_data$ID |> min() >= 1

# Checking that the only two capacity types present are Room Based Capacity and Bed Based Capacity.
simulated_shelter_data$`CAPACITY_TYPE` |>
  unique() |>
  sort() == sort(c("Room Based Capacity ", "Bed Based Capacity"))

# Checking that only two capacity types are present
simulated_shelter_data$`CAPACITY_TYPE` |>
  unique() |>
  length() == 2

# Checking that the only one location province present, which is ON
simulated_shelter_data$`LOCATION_PROVINCE` |>
  unique() |>
  sort() == sort("ON")

# Checking that the minimum value in the SERVICE_USER_COUNT column is at least 1
simulated_shelter_data$SERVICE_USER_COUNT |> min() >= 1