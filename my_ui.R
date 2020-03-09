library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)

# Pages for Shiny Application
# First Page: Overview of our data set with important analysis questions
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

# Second Page: Barchart concerning States and Mental Health Diagnosis
second_page <- tabPanel(
  "",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4(""),
      plotOutput("")
    )
  )
)

# Third Page: Scatterplot with information about the States and the
# amount of mental health facilities that provide sign language
third_page <- tabPanel(
  "",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      h4(""),
      plotOutput("")
    )
  )
)

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


# Navigation Bar and Pages
ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page, second_page, third_page, fourth_page, fifth_page
)