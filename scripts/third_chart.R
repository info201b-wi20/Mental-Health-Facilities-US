# Chart Script(s) (Austin's part)
# You should write functions that take in your dataset as a parameter,
# and return a visualization of that data.
# This will allow you to call your charting function from your index.Rmd file,
# keeping your code much easier to read and update. Create a separate .R file
# for each chart.

# Each function must return a different type of visualization
# (e.g., you can only create one Scatter Plot).
# Again, in your report you must describe why you included the chart
# (e.g., what it attempts to seeks to express), and what information it reveals.
# For each chart, we expect the following:

# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the question of
# interest and data type

library(dplyr)
library(ggplot2)

abbr_to_state <- function(abbreviation) {
  stringr::str_to_lower(setNames(append(state.name, c("Other")),
                                 append(state.abb, c("ZZ")))[abbreviation])
}

render_third_chart <- function(df) {
  df <- df %>%
    group_by(LST) %>%
    summarize(responses = n()) %>%
    mutate(region = abbr_to_state(LST))
  df <- left_join(map_data("state"), df, by = "region")
  ggplotly(ggplot(df, aes(long, lat, group = group)) +
    geom_polygon(aes(fill = responses), color = "white") +
    scale_fill_viridis_c(option = "D") +
    theme_void() +
    theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
    ggtitle("Number of Responses per State"))
}
