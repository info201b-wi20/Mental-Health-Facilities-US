library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)

source("scripts/first_chart.R")
source("scripts/second_chart.R")
source("scripts/third_chart.R")
data <- read.csv("Data/mental_health_data.csv", stringsAsFactors = F)
summary_data <-
  read.csv("Data/mental_health_summary_table.csv", stringsAsFactors = F)

my_server <- function(input, output) {
  output$first_chart <- renderPlotly({
    state_vs_diagnostics_barchart(data)
  })
  output$second_chart <- renderPlotly({
    sign_language_data(summary_data)
  })
  output$third_chart <- renderPlotly({
    render_third_chart(data)
  })
}

shinyServer(my_server)
