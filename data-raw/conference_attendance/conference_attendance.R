# AI conference attendance data

# Author: Sara Altman
# Version: 2020-05-31

# Libraries
library(tidyverse)

# Parameters
file_conference_attendance <-
  here::here("data-raw/conference_attendance/conference_attendance.csv")

#===============================================================================

conference_attendance <-
  read_csv(
    file_conference_attendance,
    col_types =
      cols(
        conference = col_character(),
        size = col_character(),
        .default = col_double()
      )
  ) %>%
  pivot_longer(
    cols = -c(conference, size),
    names_to = "year",
    values_to = "attendance"
  ) %>%
  mutate(year = as.integer(year))

usethis::use_data(conference_attendance, overwrite = TRUE)
