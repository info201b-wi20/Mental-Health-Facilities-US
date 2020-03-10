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
  "Mental Health Matters: An Overview",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("An Overview"),
      p("")
    )
  ),
  HTML("
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

#############################_1st Graph_######################################
# 3 interactive pages that can be used to explore the data. Each page should 
# revolve around a specific question
# you have of your dataset. Each page should have sufficient 
# interactivity (e.g., Shiny widgets + 1 or more reactive 
# charts) for exploring the question of interest. If you would 
#prefer to make fewer pages with more complexity, check with your TA/instructor

# Second Page: Barchart concerning States and Mental Health Diagnosis
second_page <- tabPanel(
  "Barchart: Mental Health Diagnosis Across America",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("US States and Mental Health Diagnostic Testing"),
      plotlyOutput("first_chart")
    )
  )
)

#############################_2nd Graph_#######################################
# Third Page: Scatterplot with information about the States and the
# amount of mental health facilities that provide sign language
third_page <- tabPanel(
  "Scatterplot: Sign Language Provided in Facilities",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("Sign Language Provided Across State Facilities"),
      plotlyOutput("second_chart")
    )
  )
)

# Slider Input Widget for Scatterplot
size_choice <- sliderInput("Size",
  label = "Scatterplot Point Size",
  min = 1, max = 12, value = 3
)

# Select from a List of Options for Bar Chart
choosing_color <- selectInput(
  "Color", label = "Color", choices = list("Red" = "red",
  "Orange" = "orange", "Yellow" = "yellow", "Green" = "green",
  "Blue" = "blue", "Purple" = "purple", "Black" = "black",
  "Gray" = "gray", "Pink" = "magenta")
)

#############################_3rd Graph_#######################################
# Fourth Page: Heat Map of Continental US that visualizes the number of
# mental health facilities that responded in each state
fourth_page <- tabPanel(
  "Heat Map: Amount of Reviews for Mental Health Facilities",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("Responses from Mental Health Facilities Across the US"),
      plotlyOutput("third_chart")
    )
  )
)

#############################_Takeaway Page_###################################
# Fifth Page: Major Analysis Takeaways and Insights from the Charts
# Let's do 1 insight per visualization
fifth_page <- tabPanel(
  "Analysis and Key Takeaways",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4("Insights We Gained from US Mental Health Facilities Dataset"),
      p()
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
