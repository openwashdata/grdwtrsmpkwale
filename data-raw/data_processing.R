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

samples_selection_raw <- read_excel(here::here("data-raw", "samples.xlsx"),
                                    sheet = "Selected points sampled weekly",
                                    .name_repair = "unique")

# laod periodic system data
data(periodicTable)
periodic_data <- periodicTable |> select(c(numb:name))


# explore raw data --------------------------------------------------------

samples_march_raw |> skimr::skim()
samples_june_raw |> skimr::skim()
samples_selection_raw |> skimr::skim()

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
         T_avg = Tª,
         del_18O = `d 18O`,
         del_2H = d2H) |>
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
  mutate_at(.vars = vars(conductivity:del_2H),
            .funs = as.numeric)


# samples_march |>
#   mutate_at(.vars = vars(conductivity:del_2H),
#             .funs = if_else(str_starts(pattern = "<"),
#                             true = vars(conductivity:del_2H),
#                             false = as.numeric)) |> view()

# data_purty_names <- samples_march |>
#   rename(tot_organic_carbon = TOC,
#          dissolved_oxygen = DO,
#          oxidation_reduction_potential = ORP,
#          redox_potential = eH,
#          "ammonium_(NH4)" = NH4,
#          "sulfate_(SO4)" = SO4,
#          "nitrate_(NO3)" = NO3,
#          "Phosphate_(PO4)" = PO4) |>
#   glimpse()

# data_with_names <- data_purty_names |>
#   rename_with(.cols = c(Cl,Br:U),
#               # .fn = ~ periodic_data$name[match(., periodic_data$symb)]
#               .fn = ~ paste0(periodic_data$name[match(., periodic_data$symb)], "_(", ., ")")
#               ) |> as_tibble()
# data_with_names

# create simple feature (geodata)
sf_march <- st_as_sf(samples_march, coords = c("utm_x", "utm_y"), crs = 32737) |>
  st_transform(crs = 4236)



# tidy data for sampling in june of 2016
samples_june_raw <- samples_june_raw |>
  rename(utm_x = `UTM-X`,
         utm_y = `UTM-Y`,
         date = Data,
         conductivity = Cond.,
         T_avg = Tª,
         del_18O = `d 18O`,
         del_2H = d2H) |>
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
  mutate_at(.vars = vars(conductivity:del_2H),
            .funs = as.numeric)

# create simple feature (geodata)
sf_june <- st_as_sf(samples_june, coords = c("utm_x", "utm_y"), crs = 32737) |>
  st_transform(crs = 4236)


samples_joined <- samples_march |> full_join(samples_june)

sf_joined <- st_as_sf(samples_joined, coords = c("utm_x", "utm_y"), crs = 32737) |>
  st_transform(crs = 4236)

# tidy data for sampling in march of 2016
samples_selection_raw

samples_selection <- samples_selection_raw |>
  mutate(code = Code...21, .before = everything()) |>
  select(!c(Code...1, Code...21)) |>
  rename(date = Data,
         conductivity = Cond.,
         T_avg = Tª)



# explore data ------------------------------------------------------------

## code to explore `DATASET` dataset goes here
## loops with "tidy data" section

qtm(sf_march)
qtm(sf_june)
qtm(sf_joined)


# save data ------------------------------------------------------------

## code to save `DATASET` dataset goes here

# create DATASET.rda in data directory
usethis::use_data(DATASET, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
# create export files for website
write_csv(DATASET, here::here("inst", "extdata", "DATASET.csv"))
openxlsx::write.xlsx(DATASET, here::here("inst", "extdata", "DATASET.xlsx"))

# prepare dictionaries legacy -----------------------------------------------

## will be replaced by use_dictionary_skeleton function from openwashdata pkg
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
file_names <- c("DATASET1.rda", "DATASET2.rda")

dictionary <- get_variable_info(data = list(DATASET1, DATASET2),
                                directory = directories,
                                file_name = file_names)

# export files to fill in dictionary
dictionary |>
  write_csv("data-raw/dictionary.csv")

dictionary |>
  openxlsx::write.xlsx("data-raw/dictionary.xlsx")

# prepare dictionary ------------------------------------------------------

## create a skeleton files for the dictionary

# TODO after tidy data
# output: dictionary.csv file
use_dictionary_skeleton(data_location = NULL,
                        skeleton_dest = "data-raw/dictionary.csv",
                        data_file_pattern = ".rda",
                        ignore_pattern = "codebook.Rda",
                        recursive = TRUE)
# output: dictionary.csv file
openxlsx::write.xlsx(read_csv("data-raw/dictionary.csv"), "data-raw/dictionary.xlsx")

# update dictionary -------------------------------------------------------

# TODO
# Create and update dictionary
# function that conversts dictionary as xlsx to csv for later use in roxygen
update_dictionary <- function(dictionary_path) {
  dictionary_excel <-
    readxl::read_excel(dictionary_path)

  dictionary_excel |>
    readr::write_csv("data-raw/dictionary.csv")
}

# TODO
update_dictionary("data-raw/dictionary.xlsx")

