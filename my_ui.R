library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)

#############################_Intro page_######################################
# Pages for Shiny Application
# First Page: Overview of our data set with important analysis questions
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

#############################_1st Graph_######################################
# 3 interactive pages that can be used to explore the data. Each page should revolve around a specific question
# you have of your dataset. Each page should have sufficient interactivity (e.g., Shiny widgets + 1 or more reactive 
# charts) for exploring the question of interest. If you would prefer to make fewer pages with more complexity, check 
# with your TA/instructor.

# Second Page: Barchart concerning States and Mental Health Diagnosis
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

#############################_2nd Graph_#######################################
# Third Page: Scatterplot with information about the States and the
# amount of mental health facilities that provide sign language
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

#############################_3rd Graph_#######################################
# Fourth Page: Heat Map of Continental US that visualizes the number of
# mental health facilities in each state
fourth_page <- tabPanel(
  "",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4(""),
      plotOutput("")
    )
  )
)

#############################_Takeaway Page_###################################
# Fifth Page: Major Analysis Takeaways and Insights from the Charts
# Let's do 1 insight per visualization
fifth_page <- tabPanel(
  "",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4(""),
      plotOutput("")
    )
  )
)

#############################_ui_#########################################
my_ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page, 
  second_page, 
  third_page, 
  fourth_page, 
  fifth_page
)
