# Load libraries so they are available
library(shiny)

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("my_ui.R")
source("my_server.R")


# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = my_ui, server = my_server)

# Expectation:
# Structure
# As mentioned above, you can dictate your own project structure and layout depending on the 
# focus of your project and dimensions of your dataset(s). However, to help guide you, below 
# is a basic structure that meets our expectations:

# 1. A single page providing an overview of the project -- what major questions are you seeking to answer, and 
# what data will you use to answer those questions? You should include some "additional flare" on this landing page, 
# such as an image.
# 2. Three interactive pages that can be used to explore the data. Each page should revolve around a specific question
# you have of your dataset. Each page should have sufficient interactivity (e.g., Shiny widgets + 1 or more reactive 
# charts) for exploring the question of interest. If you would prefer to make fewer pages with more complexity, check 
# with your TA/instructor.
# 3. Summary takeaways, a page that hones in on at least 3 major takeaways from the project (which should be related 
# to a specific aspect of your analysis). Feel free to incorporate tables, graphics, or other elements to convey these
# conclusions.'

# We expect any project to have the following:
# 1. Clear project navigation, leveraging Shiny's multi-page layouts as appropriate
# 2. Clear page layout on each page
# 3. Well crafted elements, including appropriately sized / labeled / designed elements, 
# as well as custom CSS styles and/or custom HTML elements