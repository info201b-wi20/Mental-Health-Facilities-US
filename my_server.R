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

min_offer_eval <- min(summary_data$Offer_diagnostic_evaluations, na.rm = TRUE)
max_offer_eval <- max(summary_data$Offer_diagnostic_evaluations, na.rm = TRUE)

my_server <- function(input, output) {
  output$first_chart <- renderPlotly({
    values <- input$eval_slider_choice
    state_vs_diagnostics_barchart(summary_data %>%
                                    filter(Offer_diagnostic_evaluations >= values[1]) %>%
                                    filter(Offer_diagnostic_evaluations <= values[2])) 
  })
  
  output$input_first_chart_number <- renderUI({
    sliderInput("eval_slider_choice", label = h3("Filtering Diagnostic Evaluations"), min = min_offer_eval, 
                max = max_offer_eval, value = c(min_offer_eval, 
                                     max_offer_eval))
  })
  output$second_chart <- renderPlotly({
    sign_language_data(summary_data)
    
  })
  output$third_chart <- renderPlotly({
    render_third_chart(data)
  })
}

shinyServer(my_server)
