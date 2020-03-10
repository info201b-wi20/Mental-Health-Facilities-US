# Load libraries so they are available
library(shiny)

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("my_ui.R")
source("my_server.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = my_ui, server = my_server)