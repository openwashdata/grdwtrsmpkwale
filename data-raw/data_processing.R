# description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy dataframe

# R packages --------------------------------------------------------------

library(tidyverse)
library(readxl)
library(lubridate)
library(here)
library(janitor)
library(PeriodicTable)
library(devtools)
library(openwashdata)
library(sf)
library(tmap)


# read data ---------------------------------------------------------------

## code to read raw dataset(s) goes here

# Done
# download and excel file
utils::download.file(url = "https://webservices.bgs.ac.uk/accessions/download/76389?fileName=GroforGood_Groundwater_Chemistry_ARCH.xlsx",
                     destfile = here::here("data-raw", "samples.xlsx"),
                     mode = "wb")

samples_march_raw <- read_excel(here::here("data-raw", "samples.xlsx"),
                                sheet = "Water Chemistry data March 2016",
                                .name_repair = "unique")

samples_june_raw <- read_excel(here::here("data-raw", "samples.xlsx"),
                               sheet = "Water Chemistry data June 2016",
                               .name_repair = "unique")

selected_samples_raw <- read_excel(here::here("data-raw", "samples.xlsx"),
                                    sheet = "Selected points sampled weekly",
                                    .name_repair = "unique")

# load periodic system data
data(periodicTable)
periodic_data <- periodicTable |> select(c(numb:name))


# explore raw data --------------------------------------------------------

samples_march_raw |> skimr::skim()
samples_june_raw |> skimr::skim()
selected_samples_raw |> skimr::skim()

# tidy data ---------------------------------------------------------------
tmap_mode("view")

## code to tidy dataset(s) goes here
## generates `DATASET` dataset

# tidy data for sampling in march of 2016
samples_march_raw <- samples_march_raw |>
  rename(utm_x = `UTM-X`,
         utm_y = `UTM-Y`,
         date = Data,
         conductivity = Cond.,
         T_avg = `T<U+00AA>`,
         # T_avg = Tª,
         delta_O_18 = `d 18O`,
         delta_H_2 = d2H) |>
  rename_with(.cols = c(Localization, Geology, Alkalinity),
              .fn = tolower)

# remove unit rows from dataset
samples_march <- samples_march_raw |>
  drop_na(localization)

samples_march <- samples_march |>
  mutate(across(.cols = c(Li:U),
                .fns = ~ if_else(. == "<0.8", "0.7999", .))) |>
  mutate(NH4 = case_when(
                  NH4 == ">8" ~ "8.0001",
                  NH4 == "0.5-0.8" ~ "0.65",
                  NH4 == "0.2-0.5" ~ "0.35",
                  .default = NH4)) |>
  mutate(PO4 = str_replace(PO4, "<LOQ", "10")) |>
  mutate_at(.vars = vars(conductivity:delta_H_2),
            .funs = as.numeric)

# create simple feature (geodata)
sf_march <- st_as_sf(samples_march, coords = c("utm_x", "utm_y"), crs = 21037) |>
  st_transform(crs = 4236)



# tidy data for sampling in june of 2016
samples_june_raw <- samples_june_raw |>
  rename(utm_x = `UTM-X`,
         utm_y = `UTM-Y`,
         date = Data,
         conductivity = Cond.,
         T_avg = `T<U+00AA>`,
         # T_avg = Tª,
         delta_O_18 = `d 18O`,
         delta_H_2 = d2H) |>
  rename_with(.cols = c(Localization, Geology, Alkalinity),
              .fn = tolower)

# remove unit rows from dataset
samples_june <- samples_june_raw |>
  drop_na(localization)

samples_june <- samples_june |>
  mutate(across(.cols = c(Li:U),
                .fns = ~ if_else(. == "<0,8" | . == "<0.8", "0.7999", .))) |>
  mutate(across(.cols = c(NH4:F),
                .fns = ~ str_replace(., "<LOQ", "10.0000"))) |>
  mutate_at(.vars = vars(conductivity:delta_H_2),
            .funs = as.numeric)

# create simple feature (geodata)
sf_june2 <- st_as_sf(samples_june, coords = c("utm_x", "utm_y"), crs = 21037) |>
  st_transform(crs = 4236)

water_samples <- samples_march |> full_join(samples_june)

sf_samples <- st_as_sf(water_samples, coords = c("utm_x", "utm_y"), crs = 21037) |>
  st_transform(crs = 4236)

## tidy data of selected locations that were collected weekly

selected_samples_raw <- selected_samples_raw |>
  mutate(code = Code...21, .before = everything()) |>
  select(!c(Code...1, Code...21)) |>
  rename(date = Data,
         conductivity = Cond.,
         T_avg = Tª)

selected_samples <- selected_samples_raw |>
  drop_na(date)

selected_samples <-  selected_samples |>
  mutate(across(.cols = c(Li:U),
                .fns = ~ if_else(. == "<0,8" | . == "<0.8", "0.7999", .))) |>
  mutate(across(.cols = c(PO4:Br),
                .fns = ~ str_replace(., "<LOQ", "10.0000"))) |>
  mutate_at(.vars = vars(conductivity:U),
            .funs = as.numeric)

# explore data ------------------------------------------------------------

## code to explore `DATASET` dataset goes here
## loops with "tidy data" section

samples_march |> skimr::skim()
samples_june |> skimr::skim()
water_samples |> skimr::skim()
selected_samples |> skimr::skim()

qtm(sf_march)
qtm(sf_june)
qtm(sf_samples)


# save data ------------------------------------------------------------

## code to save `DATASET` dataset goes here

# DONE
# create export files folder
# fs::dir_create(here::here("inst", "extdata"))

# UPDATE
# create DATASET.rda in data directory
usethis::use_data(water_samples, selected_samples, overwrite = TRUE)

# UPDATE
# create export files for website
write_csv(water_samples, here::here("inst", "extdata", "water_samples.csv"))
openxlsx::write.xlsx(water_samples, here::here("inst", "extdata", "water_samples.xlsx"))

write_csv(selected_samples, here::here("inst", "extdata", "selected_samples.csv"))
openxlsx::write.xlsx(selected_samples, here::here("inst", "extdata", "selected_samples.xlsx"))

# prepare and create skeleton dictionary files (legacy) -----------------------------------------------
## will be replaced by use_dictionary_skeleton function from openwashdata pkg

# Lars' function to create a skeleton of the dictionary
get_variable_info <- function(data, directory = "", file_name = "") {
  total_variables <- sum(sapply(data, function(df) length(names(df))))

  variable_info <- tibble(
    directory = character(total_variables),
    file_name = character(total_variables),
    variable_name = character(total_variables),
    variable_type = character(total_variables),
    description = character(total_variables)
  )

  index <- 1

  for (i in seq_along(data)) {
    dataframe <- data[[i]]
    variable_names <- names(dataframe)
    variable_types <- sapply(dataframe, typeof)

    num_variables <- length(variable_names)
    variable_info$variable_name[index:(index + num_variables - 1)] <- variable_names
    variable_info$variable_type[index:(index + num_variables - 1)] <- variable_types
    variable_info$file_name[index:(index + num_variables - 1)] <- rep(file_name[i], num_variables)
    variable_info$directory[index:(index + num_variables - 1)] <- rep(directory[i], num_variables)

    index <- index + num_variables
  }

  return(variable_info)
}

# Specify values for directory and file_name
directories <- c("data/", "data/")
file_names <- c("water_samples.rda", "selected_samples.rda")

dictionary_raw <- get_variable_info(data = list(water_samples, selected_samples),
                                directory = directories,
                                file_name = file_names)

# export files to fill in dictionary manually
dictionary_raw |>
  write_csv("data-raw/dictionary.csv")

dictionary_raw |>
  openxlsx::write.xlsx("data-raw/dictionary.xlsx")

# fill dictionary ---------------------------------------------------------

## Quick fixes

# fixes wrong variable type info for datetime variables
dictionary_raw <- dictionary_raw |>
  mutate(variable_type = if_else(variable_name == "date",
                                 str_replace(variable_name, "date", "dttm"),
                                 variable_type))

## add additional variables containing the unit type and the error of the measurement

# Quite ugly way to fill in the information about the unit type and error
get_unit_info <- function(data, dictionary, file_name = "") {
  dataset <- data
  dictionary_temp <- dictionary

  dictionary_unit <- dataset |>
    slice_head(n = 2) |>
    mutate(across(.cols = everything(), as.character),
           variable_names = c("unit_type", "error"), .before = everything()) |>
    pivot_longer(cols = -1, names_to = "variable_name") |>
    pivot_wider(names_from = variable_names) |>
    mutate(file_name = file_name, .before = everything())

  dictionary_out <- left_join(dictionary_temp, dictionary_unit,
                              by = join_by(file_name, variable_name))

  return(dictionary_out)
}

dictionary_select <- get_unit_info(selected_samples_raw, dictionary_raw, "selected_samples.rda")
dictionary_water <- get_unit_info(samples_march_raw, dictionary_raw, "water_samples.rda")

dictionary <- dictionary_water |>
  mutate(unit_type = if_else((file_name == "selected_samples.rda"),
                             dictionary_select$unit_type,
                             unit_type)) |>
  mutate(error = if_else((file_name == "selected_samples.rda"),
                         dictionary_select$error,
                         error))

## exploratory break

# explore the current state of the dictionary
dictionary |> view()

# explore dictionary (especially unit_type)
dictionary |> count(unit_type)
# we have 7 different unit types:
# "(mg/L)"; "(µS/cm)"; "Arc 1960"; "as mg/L HCO3"; "mV"; "ppb"; "°C"

## Add descriptions based on unit types

dictionary <- dictionary |>
  mutate(description = case_when(
    (unit_type == "(mg/L)") ~ case_when(
      variable_name == "TOC" ~ "Total organic carbon (TOC) is an analytical parameter representing the concentration of organic carbon in a sample.",
      variable_name == "DO" ~ "Dissolved oxygen (DO) levels in environmental water depend on the physiochemical and biochemical activities in water body and it is an important useful in pollution and waste treatment process control.",
      variable_name == "NH4" ~ "Ammonium concentration in (mg/L).",
      variable_name == "SO4" ~ "Sulfate concentration in (mg/L)",
      variable_name == "NO3" ~ "Nitrate concentration in (mg/L)",
      variable_name == "PO4" ~ "Phosphate concentration in (mg/L)",
      .default = paste0(periodic_data$name[match(variable_name, periodic_data$symb)], " concentration in (mg/L)")),
    (unit_type == "ppb") ~ paste0(periodic_data$name[match(variable_name, periodic_data$symb)], " concentration in parts per billion (ppb)."),
    (unit_type == "(µS/cm)") ~ "Conductivity of the sample in (µS/cm)",
    (unit_type == "Arc 1960") ~ "Geospatial data of the water sampling locations. The geographic coordinate system 'Arc 1960 / UTM zone 37S' (EPSG:21037) which is used for the areas of Kenya and Tanzania - south of equator and east of 36°E.",
    (unit_type == "as mg/L HCO3") ~ "Alkalinity of the sample as mg of bicarbonate (HCO3) per liter (mg[HCO3]/L).",
    (unit_type == "mV") ~ case_when(
      variable_name == "ORP" ~ "Oxidation reduction potential (ORP) in (mV).",
      variable_name == "eH" ~ "Redox potential (eH) in (mV).",
      .default = description),
    (unit_type == "°C") ~ "Average ambient temperature at the time of the sampling",
    .default = description))


## exploratory break

# explore the current state of the dictionary
dictionary |> view()

# explore the missing descriptions
dictionary |> filter(description == "")
# We have 7 missing descriptions...

dictionary <- dictionary |>
  mutate(description = case_when(
    variable_name == "localization" ~ "Name of the localization where the sample was taken.",
    variable_name == "geology" ~ "Composition of the ground.",
    variable_name == "date" ~ "Date the sample was taken.",
    variable_name == "pH" ~ "Acidity/basicity of the sample using the pH value.",
    variable_name == "delta_O_18" ~ "The ratio of stable isotopes oxygen-18 (18O) and oxygen-16 (16O) as a measure of groundwater/mineral interactions.",
    variable_name == "delta_H_2" ~ "δ2H, or delta deuterium, is a measure of the relative abundance of deuterium (a stable isotope of hydrogen) in a sample, often used in hydrology and environmental science to trace the origin and movement of water.",
    variable_name == "code" ~ "",
    .default = description)) |> view()

# TODO
# Add these Warnings somwhere in the documentation!!!
# "WARNING: 'NH4 == 8.0001' means 'NH4 > 8'; 'NH4 == 0.65' means '0.5 < NH4 < 0.8'; 'NH4 == 0.35' means '0.2 < NH4 < 0.5'"
# "WARNING: If value is equal shows 0.7999 (watch out for rounded numbers!) it can only be said, that the values is bellow 0.8."
# "Which temperature was taken?
# LOQ? LOD?
# What is "Code"

# TODO
# update dictionary -------------------------------------------------------

# export files to fill in dictionary manually
dictionary_raw |>
  write_csv("data-raw/dictionary.csv")

dictionary_raw |>
  openxlsx::write.xlsx("data-raw/dictionary.xlsx")

