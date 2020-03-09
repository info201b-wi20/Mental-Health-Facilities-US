library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)

#############################_ui_#########################################
ui <- navbarPage(
  
#############################_1st Graph_#########################################
# 3 interactive pages that can be used to explore the data. Each page should revolve around a specific question
# you have of your dataset. Each page should have sufficient interactivity (e.g., Shiny widgets + 1 or more reactive 
# charts) for exploring the question of interest. If you would prefer to make fewer pages with more complexity, check 
# with your TA/instructor.

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

#############################_2nd Graph_#########################################
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

#############################_3rd Graph_#########################################
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


#############################_Takeaway Page_#########################################
# Summary takeaways, a page that hones in on at least 3 major takeaways from the project (which should be related 
# to a specific aspect of your analysis). Feel free to incorporate tables, graphics, or other elements to convey these
# conclusions.'

my_ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page,
  second_page,
  third_page
)