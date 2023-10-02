library(tidyverse)
library(here)
library(janitor)
library(devtools)
library(openwashdata)
library(desc)

# Add documentation -------------------------------------------------------

# Done
# load openwashdata package
# devtools::install_github("openwashdata/openwashdata")
library(openwashdata)

# Done
# Initiate documentation folder for writing up metadata and documentation for objects
dir.create("R")
usethis::use_r("selected_samples")
usethis::use_r("water_samples")

# DONE
# Add documentation from data dictionary to script as roxygen
openwashdata::generate_roxygen_docs("data-raw/dictionary.csv", output_file_path = "R/selected_samples.R")
openwashdata::generate_roxygen_docs("data-raw/dictionary.csv", output_file_path = "R/water_samples.R")

# Done
# Add data description to DATASET.R files

# DONE
# Add an additional package documentation to Package
usethis::use_package_doc()

# DONE
# Add license
usethis::use_ccby_license()

# TB UPDATED
# Add dependencies in DESCRIPTION file
# use_package("tidyverse")

# TB UPDATED
# add authors -------------------------------------------------------------

use_author(
  given = "Mian",
  family = "Zhong",
  role = c("aut", "cre"),
  email = "mzhong@ethz.ch",
  comment = c(ORCID = "0009-0009-4546-7214"))

use_author(
  given = "Sebastian Camilo",
  family = "Loos",
  role = c("aut"),
  email = "sloos@ethz.ch",
  comment = c(ORCID = "0000-0002-8830-1734"))
# Add CITATION.cff file
cffr::cff_write()

# load, document, check, and install
devtools::load_all()  # "Cmd + Shift + L"
devtools::document()  # "Cmd + Shift + D"
devtools::check()     # "Cmd + Shift + E"
devtools::install()   # "Cmd + Shift + B"

# DONE
# Create a rmd README for package
usethis::use_readme_rmd()

# TODO
# Knit README.Rmd once!!!

# TODO
# Create an examples article for the package
usethis::use_article("examples")
devtools::build_rmd("vignettes/articles/examples.Rmd")

# TODO
# Add automated CMD BUILD check
usethis::use_github_action_check_standard()

# TODO
# Setup pkgdown configuration and github actions
usethis::use_pkgdown()

# Build pkgdown website
pkgdown::build_site()
