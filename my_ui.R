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
  third_page,
  footer = HTML("
    <img src='https://go.aws/38xnkMQ' alt='chocolate bar' id='chocolate'>
    <style>
      #chocolate {
        animation: footer 10s infinite ease-out;
        width: 100px;
        position: fixed;
        bottom: 16px;
      }
      
      @keyframes footer {
        0%, 10%, 90%, 100% {
          margin-left: 8px;
          transform: rotate(0deg) rotateY(0deg);
        }
        40%, 60% {
          margin-left: calc(100% - 108px);
          transform: rotate(720deg) rotateY(360deg);
        }
      }
    </style>
  ")
)