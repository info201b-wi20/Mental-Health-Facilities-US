library(dplyr)
library(ggplot2)
library(shiny)
library(plotly)

#############################_Intro page_######################################
# Pages for Shiny Application
# First Page: Overview of our data set with important analysis questions
first_page <- tabPanel(
  "Mental Health Matters: An Overview",
  fillPage(
    h4("An Overview"),
    p("Mental health is a topic that is ever prevalent in our society,
      and mental health issues/illness is a problem that is always growing,
      even more so in our generation. Therefore treatment for mental health
      problems is growing in demand as well. Because of this, people are
      going to want the treatment that will suit them the best. But the
      best care might not be in the state that they reside in, so this
      project aims to answer a few major questions to give people a better
      idea of where they might want to go to get the treatment they want:
      \n1. Which states have the most amount of options in terms of
      facilities that operate there?
      \n2. Which states have facilities that provide services for disabled 
      patients, such as sign language for the hard of hearing/deaf?
      \n3. How many facilities per state actually took time to give 
      information about their facilities?
      \n\n In order to answer these questions, as well as to learn more
      about mental health facilities in different states,we used the data set 
      made from the National Mental Health Services Survey 2018
      by the Substance Abuse & Mental Health Data Archive(SAMHDA) the link 
      for this is: https://datafiles.samhsa.gov/study-dataset/national-mental
      -health-services-survey-2018-n-mhss-2018-ds0001-nid18767.
      From there we created a new dataset made from filtering 
      the original dataset, and utilized that to compute our data.")
  ),
  # Makes Team Chocolate Logo :D
  HTML("
    <img src='https://go.aws/38xnkMQ' alt='chocolate bar' class='chocolate'>
  ")
)

#############################_1st Graph_######################################
# Second Page: Barchart concerning States and Mental Health Diagnosis
second_page <- tabPanel(
  "Barchart: Mental Health Diagnosis Across America",
  sidebarLayout(
    sidebarPanel(
      # Sliding Input Widget for Diagnostics
      uiOutput(
        "input_first_chart_number"
      )
    ),
    mainPanel(
      h4("US States and Mental Health Diagnostic Testing"),
      plotlyOutput("first_chart")
    )
  )
)

#############################_2nd Graph_#######################################
# Third Page: Scatterplot with information about the States and the
# amount of mental health facilities that provide sign language

# Slider Input Widget for Scatterplot
size_choice <- sliderInput(inputId = "point_size",
                           label = "Scatterplot Point Size",
                           min = 1, max = 12, value = 3
)

third_page <- tabPanel(
  "Scatterplot: Sign Language Provided in Facilities",
  sidebarLayout(
    sidebarPanel(size_choice),
    mainPanel(
      h4("Sign Language Provided Across State Facilities"),
      plotlyOutput("second_chart")
    )
  )
)

#############################_3rd Graph_#######################################
# Fourth Page: Heat Map of Continental US that visualizes the number of
# mental health facilities that responded in each state
fourth_page <- tabPanel(
  "Heat Map: Amount of Reviews for Mental Health Facilities",
  sidebarLayout(
    sidebarPanel(
      uiOutput("input_third_states"),
      uiOutput("input_third_num")
    ),
    mainPanel(
      h4("Responses from Mental Health Facilities Across the US"),
      p("Note that this can take a few seconds to load."),
      plotlyOutput("third_chart")
    )
  )
)

#############################_Takeaway Page_###################################
# Fifth Page: Major Analysis Takeaways and Insights from the Charts
# Let's do 1 insight per visualization
fifth_page <- tabPanel(
  "Analysis and Key Takeaways",
  fillPage(
    h4("Insights We Gained from US Mental Health Facilities Dataset"),
    p("Major Takeaways:
    1. For all three of our charts, California and New York had the 
      most amount of facilities that were related to the charts topic.
      This has the broader implication that states that have a higher
      population has more options in terms of facilities.
      2. The states located in the outer regions of the United States
      had higher numbers in comparison to the middle regions of the US.
      This has the implication that people may be more open in terms of 
      their mental health issues in states that have higher populations, 
      which is typically the outer states. This in turn makes mental health
      facilities be more concentrated in the outer states, rather than the 
      inner states.
      3. Almost all states have less than half the number of facilities 
      compared to the states that have the highest number for each 
      chart topic (California and New York). This ties in to the implication
      that more facilities are located in places with higher populations. 
      Another implication this may show is that California and New York may 
      also be more open compared to the other states in terms of transparency 
      in their practices."),
    HTML("
      <img src='https://go.aws/38xnkMQ' alt='chocolate bar' class='chocolate'>
    ")
  )
)

#############################_ui_#########################################
my_ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page, 
  second_page, 
  third_page, 
  fourth_page,
  fifth_page,
  theme = shinythemes::shinytheme("cerulean"),
  footer = HTML("   
    <style>
      .chocolate {
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
          margin-left: calc(100% - 124px);
          transform: rotate(720deg) rotateY(360deg);
        }
      }
    </style>
  ")
)
