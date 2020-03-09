library(styler)
library(lintr)
library(dplyr)
library(ggplot2)
library(shiny)

#############################_First Page_#########################################
# A single page providing an overview of the project -- what major questions are you seeking to answer, and 
# what data will you use to answer those questions? You should include some "additional flare" on this landing page, 
# such as an image.

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

#############################_1st Graph_#########################################
# 3 interactive pages that can be used to explore the data. Each page should revolve around a specific question
# you have of your dataset. Each page should have sufficient interactivity (e.g., Shiny widgets + 1 or more reactive 
# charts) for exploring the question of interest. If you would prefer to make fewer pages with more complexity, check 
# with your TA/instructor.


#############################_2nd Graph_#########################################



#############################_3rd Graph_#########################################


#############################_Takeaway Page_#########################################
# Summary takeaways, a page that hones in on at least 3 major takeaways from the project (which should be related 
# to a specific aspect of your analysis). Feel free to incorporate tables, graphics, or other elements to convey these
# conclusions.'


#############################_ui_#########################################
ui <- navbarPage(
  "Mental Health Facilities Across the US",
  first_page
)