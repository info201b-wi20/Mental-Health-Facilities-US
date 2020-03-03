# Chart Script(s) (Chris's part)
# You should write functions that take in your dataset as a parameter, and return a visualization of that data. 
# This will allow you to call your charting function from your index.Rmd file, keeping your code much easier to read and update. 
# Create a separate .R file for each chart.

# Each function must return a different type of visualization (e.g., you can only create one Scatter Plot).  
# Again, in your report you must describe why you included the chart (e.g., what it attempts to seeks to express), 
# and what information it reveals. For each chart, we expect the following:
  
# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the question of interest and data type
library(dplyr)
library(ggplot2)
library(plotly)

# For the data, we used a data table that is essentially a summary table of the main data set that we used.
# This is all inside of the data folder

sign_language_data <- function(df) {
  ggplot(data = df) + 
    geom_point(mapping = aes(x = State, y = Provides_sign_language)) +
  
  labs(
    title = "Amount of Institutions Per State That Provides Sign Language",
    x = "States",
    y = "Amount of Institutions"
  )
}
