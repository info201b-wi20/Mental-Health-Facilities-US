library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)

# Pages for Shiny Application
first_page <- tabPanel(
  "A",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("A"),
      plotlyOutput("firstChart")
    )
  )
)

second_page <- tabPanel(
  "B",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("B"),
      plotlyOutput("secondChart")
    )
  )
)

third_page <- tabPanel(
  "C",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("C"),
      plotlyOutput("thirdChart")
    )
  )
)

my_ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page,
  second_page,
  third_page
)