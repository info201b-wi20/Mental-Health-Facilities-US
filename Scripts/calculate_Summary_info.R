# Summary Information Script (Sophia's part)
# The first file you should save in your scripts/ directory should contain a function that takes in a dataset as a parameter, 
# and returns a list of information about it. For example:

rm(list = ls())
# Libraries Needed
library(styler)
library(lintr)
library(dplyr)

mental_health_resources <- read.csv("../Data/mental_health_summary_table.csv",
  stringsAsFactors = FALSE)

# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(mental_health_resources) {
# total facilities across America that offer mental health resources
total_mental_health_facilities <-
  sum(mental_health_resources$Offer_diagnostic_evaluations)
# state that has the most mental health facilities
state_highest_mental_health_resources <- mental_health_resources %>%
  filter(Offer_diagnostic_evaluations ==
    max(Offer_diagnostic_evaluations, na.rm = TRUE)) %>%
  pull(State)
# number of facilities that provide mental health resources in WA
washington_facilities <- mental_health_resources %>%
  select(State, Offer_diagnostic_evaluations) %>%
  filter(State == "WA") %>%
  pull(Offer_diagnostic_evaluations)
# facilities that conducted diagnostic tests but also did followup checkups
# on those patients
percent_with_followup_checkups <- mental_health_resources %>%
  select(Offer_diagnostic_evaluations, Regularly_followup_after_discharge) %>%
  summarize(percent_followup_checks =
    round(sum(Regularly_followup_after_discharge) /
    sum(Offer_diagnostic_evaluations) * 100, digits = 2)) %>%
  pull()
# facilities across the nation that utilize sign language
facilities_with_sign_language <- mental_health_resources %>%
  select(Offer_diagnostic_evaluations, Provides_sign_language) %>%
  summarize(percent_with_sign_lang = round(sum(Provides_sign_language) /
    sum(Offer_diagnostic_evaluations) * 100, digits = 2)) %>%
  pull()
ret <- list(total = total_mental_health_facilities, most_resources =
  state_highest_mental_health_resources, washington = washington_facilities,
  followups = percent_with_followup_checkups, sign_language =
    facilities_with_sign_language)
    return (ret)
  }  

list_summary <- get_summary_info(mental_health_resources)

# We don't expect you to write a generalizable function that works with any dataset. 
# Instead, think of this like a simple analysis you would do on this particular dataset, just wrapped in a function. 
# This will allow you to pass your dataset into this function from your index.Rmd file. 
# The file must compute at least 5 different values from your data that you believe are pertinent to share. 