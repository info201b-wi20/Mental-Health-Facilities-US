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

num_responses <- data %>% group_by(LST) %>% summarize(num_responses = n())

data_states <- lapply(
  lapply(data %>%
           select(LST) %>%
           distinct() %>%
           filter(LST %in% state.abb) %>%
           pull(), abbr_to_state),
  stringr::str_to_title)

my_server <- function(input, output) {
  output$first_chart <- renderPlotly({
    values <- input$eval_slider_choice
    state_vs_diagnostics_barchart(summary_data %>%
    filter(Offer_diagnostic_evaluations >= values[1]) %>%
    filter(Offer_diagnostic_evaluations <= values[2])) 
  })

  output$input_first_chart_number <- renderUI({
    sliderInput("eval_slider_choice",
    label = h3("Filtering Diagnostic Evaluations"), min = min_offer_eval, 
    max = max_offer_eval, value = c(min_offer_eval, max_offer_eval))
  })
  output$second_chart <- renderPlotly({
    print(input$point_size)
    sign_language_data(summary_data, input$point_size)
    
  })
  
  output$third_chart <- renderPlotly({
    states_to_show_by_number <- num_responses %>%
      filter(num_responses >= input$state_slider_choice[1]) %>%
      filter(num_responses <= input$state_slider_choice[2]) %>%
      select(LST) %>%
      pull()
    render_third_chart(data %>%
                         mutate(state_full = stringr::str_to_title(abbr_to_state(LST))) %>%
                         filter(state_full %in% input$states_selected) %>%
                         filter(LST %in% states_to_show_by_number))
  })
  
  output$input_third_states <- renderUI({
    selectInput(
      "states_selected",
      "States to Show",
      data_states,
      selected = data_states,
      multiple = T
    )
  })
  
  output$input_third_num <- renderUI({
    sliderInput(
      "state_slider_choice",
      label = "Filter By Number of Responses",
      min = min(num_responses$num_responses, na.rm = T),
      max = max(num_responses$num_responses, na.rm = T),
      value = c(min(num_responses$num_responses, na.rm = T),
                max(num_responses$num_responses, na.rm = T))
    )
  })
}

shinyServer(my_server)
