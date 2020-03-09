library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)

# Pages for Shiny Application
first_page <- tabPanel(
  "",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4(""),
      plotOutput("")
    )
  )
)

ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page
)