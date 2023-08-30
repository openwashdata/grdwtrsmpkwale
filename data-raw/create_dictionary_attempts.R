# Attempt #1 --------------------------------------------------------------

total_variables <- sum(sapply(selected_samples_raw, function(df) length(names(df))))

variable_info <- tibble(
  directory = character(total_variables),
  file_name = character(total_variables),
  variable_name = character(total_variables),
  variable_type = character(total_variables),
  description = character(total_variables),
  # unit_type = character(total_variables),
  # uncertainty = character(total_variables)
)

index <- 1

for (i in seq_along(selected_samples_raw)) {
  dataframe <- selected_samples_raw[[i]]
  variable_names <- names(dataframe)
  variable_types <- sapply(dataframe, typeof)
  # unit_types <- sapply(head(dataframe, n = 1))
  # uncertainties <-

  num_variables <- length(variable_names)
  variable_info$variable_name[index:(index + num_variables - 1)] <- variable_names
  variable_info$variable_type[index:(index + num_variables - 1)] <- variable_types
  variable_info$file_name[index:(index + num_variables - 1)] <- rep(file_name[i], num_variables)
  variable_info$directory[index:(index + num_variables - 1)] <- rep(directory[i], num_variables)
  # variable_info$unit_type[index:(index + num_variables - 1)] <- unit_types
  # variable_info$uncertainty[index:(index + num_variables - 1)] <- uncertainties

  index <- index + num_variables
}


# Attempt #2 --------------------------------------------------------------

create_dictionary <- function(...) {
  datasets <- list(...)
  num_datasets <- length(datasets)

  # Initialize an empty dataframe
  dictionary <- data.frame(
    directory = character(),
    file_name = character(),
    variable_name = character(),
    variable_type = character(),
    unit_type = character(),
    uncertainty = character(),
    description = character(),
    stringsAsFactors = FALSE
  )

  # Iterate through datasets and extract information
  for (i in seq_along(datasets)) {
    dataset <- datasets[[i]]
    dataset_name <- deparse(substitute(dataset))
    dataset_vars <- ls(dataset)

    for (var_name in dataset_vars) {
      var <- get(var_name, envir = dataset)
      var_type <- typeof(var)
      unit <- if (length(var) >= 1) as.character(var[1]) else NA
      uncertainty <- if (length(var) >= 2) as.character(var[2]) else NA

      dictionary <- rbind(
        dictionary,
        data.frame(
          directory = dataset_name,
          file_name = paste0(dataset_name, ".rda"),
          variable_name = var_name,
          variable_type = var_type,
          unit_type = unit,
          uncertainty = uncertainty,
          description = character()
        )
      )
    }
  }

  return(dictionary)
}

# Example usage:
# Assuming you have saved datasets named "water.rda" and "temperature.rda"
water <- data.frame(value = c(10, 20), unit = "m^3", uncertainty = "0.1")
temperature <- data.frame(value = c(25, 30), unit = "°C", uncertainty = "0.5")
save(water, file = "water.rda")
save(temperature, file = "temperature.rda")

# Creating the dictionary
result <- create_dictionary(water, temperature)
print(result)

# Attempt #3 --------------------------------------------------------------

create_dictionary2 <- function(..., datasets = list(...)) {
  num_datasets <- length(datasets)

  # Initialize an empty dataframe
  dictionary <- data.frame(
    directory = character(),
    file_name = character(),
    variable_name = character(),
    variable_type = character(),
    unit_type = character(),
    uncertainty = character(),
    description = character(),
    stringsAsFactors = FALSE
  )

  # Iterate through datasets and extract information
  for (i in seq_along(datasets)) {
    dataset_name <- names(datasets)[i]
    dataset <- datasets[[i]]
    dataset_vars <- ls(dataset)

    for (var_name in dataset_vars) {
      var <- eval(parse(text = paste0("dataset$", var_name)))
      var_type <- typeof(var)
      unit <- if (length(var) >= 1) as.character(var[1]) else NA
      uncertainty <- if (length(var) >= 2) as.character(var[2]) else NA

      dictionary <- rbind(
        dictionary,
        data.frame(
          directory = dataset_name,
          file_name = paste0(dataset_name, ".rda"),
          variable_name = var_name,
          variable_type = var_type,
          unit_type = unit,
          uncertainty = uncertainty,
          description = character()
        )
      )
    }
  }

  return(dictionary)
}

# Example usage:
water <- data.frame(value = c(10, 20), unit = "m^3", uncertainty = "0.1")
temperature <- data.frame(value = c(25, 30), unit = "°C", uncertainty = "0.5")

# Creating the dictionary
result <- create_dictionary2(water = water, temperature = temperature)
print(result)

# Attempt #4 --------------------------------------------------------------

create_dictionary3 <- function(..., datasets = list(...)) {
  num_datasets <- length(datasets)

  # Initialize an empty list to store data frames
  dictionary_list <- list()

  # Iterate through datasets and extract information
  for (i in seq_along(datasets)) {
    dataset_name <- names(datasets)[i]
    dataset <- datasets[[i]]
    dataset_vars <- ls(dataset)

    data_frames <- list()

    for (var_name in dataset_vars) {
      var <- eval(parse(text = paste0("dataset$", var_name)))
      var_type <- typeof(var)
      unit <- if (length(var) >= 1) as.character(var[1]) else NA
      uncertainty <- if (length(var) >= 2) as.character(var[2]) else NA

      data_frames <- c(data_frames,
                       data.frame(
                         directory = dataset_name,
                         file_name = paste0(dataset_name, ".rda"),
                         variable_name = var_name,
                         variable_type = var_type,
                         unit_type = unit,
                         uncertainty = uncertainty,
                         description = character(),
                         stringsAsFactors = FALSE
                       )
      )
    }

    dictionary_list[[dataset_name]] <- data_frames
  }

  # Combine data frames from all datasets
  dictionary <- do.call(rbind, dictionary_list)

  return(dictionary)
}

# Example usage:
water <- data.frame(value = c(10, 20), unit = "m^3", uncertainty = "0.1")
temperature <- data.frame(value = c(25, 30), unit = "°C", uncertainty = "0.5")

# Creating the dictionary
result <- create_dictionary3(water = water, temperature = temperature)
print(result)

# Attempt #5 --------------------------------------------------------------

library(tibble)

create_dictionary1 <- function(..., datasets = list(...)) {
  dictionary_list <- list()

  for (i in seq_along(datasets)) {
    dataset_name <- names(datasets)[i]
    dataset <- datasets[[i]]
    dataset_vars <- ls(dataset)

    data_frames <- list()

    for (var_name in dataset_vars) {
      var <- eval(parse(text = paste0("dataset$", var_name)))
      var_type <- typeof(var)
      unit <- if (length(var) >= 1) as.character(var[1]) else NA
      uncertainty <- if (length(var) >= 2) as.character(var[2]) else NA

      data_frames <- c(data_frames, tibble(
        directory = dataset_name,
        file_name = paste0(dataset_name, ".rda"),
        variable_name = var_name,
        variable_type = var_type,
        unit_type = unit,
        uncertainty = uncertainty,
        description = character()
      ))
    }

    dictionary_list[[dataset_name]] <- data_frames
  }

  dictionary <- bind_rows(dictionary_list)

  return(dictionary)
}

# Example usage:
water <- data.frame(value = c(10, 20), unit = "m^3", uncertainty = "0.1")
temperature <- data.frame(value = c(25, 30), unit = "°C", uncertainty = "0.5")

# Creating the dictionary
result <- create_dictionary1(water = water, temperature = temperature)
result |> view()

# Attempt #6 --------------------------------------------------------------

library(tibble)

create_dictionary7 <- function(...) {
  datasets <- list(...)
  num_datasets <- length(datasets)

  variable_info <- list()

  for (i in seq_along(datasets)) {
    dataset_name <- deparse(substitute(datasets[[i]]))
    dataset <- datasets[[i]]
    dataset_vars <- ls(dataset)

    for (var_name in dataset_vars) {
      var <- dataset[[var_name]]
      var_type <- if (class(var) == "POSIXct") "dttm" else typeof(var)
      unit <- if (length(var) >= 1) as.character(var[1]) else NA
      error <- if (length(var) >= 2) as.character(var[2]) else NA

      variable_info <- c(variable_info, tibble(
        directory = dataset_name,
        file_name = paste0(dataset_name, ".rda"),
        variable_name = var_name,
        variable_type = var_type,
        unit_type = unit,
        error = error,
        description = character()
      ))
    }
  }

  dictionary <- bind_rows(variable_info)

  return(dictionary)
}

# Example usage:
water <- data.frame(value = c(10, 20), unit = "m^3", error = 0.1)
temperature <- data.frame(value = c(25, 30), unit = "°C", error = 0.5)

# Creating the dictionary
result <- create_dictionary7(water = water, temperature = temperature)
print(result)
