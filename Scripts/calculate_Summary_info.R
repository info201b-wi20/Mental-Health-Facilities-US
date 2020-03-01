# Summary Information Script (Sophia's part)
# The first file you should save in your scripts/ directory should contain a function that takes in a dataset as a parameter, 
# and returns a list of information about it. For example:

library(styler)
library(lintr)
library(dplyr)
library(tidyr)
library(knitr)

mental_health_resources <- read.csv("../Data/mental_health_summary_table.csv",
  stringsAsFactors = FALSE)
  
state_highest_mental_health_resources <- mental_health_resources %>%
  filter(Offer_diagnostic_evaluations ==
  max(Offer_diagnostic_evaluations, na.rm = TRUE)) %>%
  pull(State)
  
  # A function that takes in a dataset and returns a list of info about it:
  get_summary_info <- function(dataset) {
    ret <- list()
    ret$length <- length(dataset)
    # do some more interesting stuff
    return (ret)
  }  

# We don't expect you to write a generalizable function that works with any dataset. 
# Instead, think of this like a simple analysis you would do on this particular dataset, just wrapped in a function. 
# This will allow you to pass your dataset into this function from your index.Rmd file. 
# The file must compute at least 5 different values from your data that you believe are pertinent to share. 