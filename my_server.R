library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)

source("scripts/first_chart.R")
source("scripts/second_chart.R")
source("scripts/third_chart.R")

server <- function(input, output) {
  
}

shinyServer(server)
