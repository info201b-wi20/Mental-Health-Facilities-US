# Chart Script(s) (Austin's part)
# You should write functions that take in your dataset as a parameter, and return a visualization of that data. 
# This will allow you to call your charting function from your index.Rmd file, keeping your code much easier to read and update. Create a separate .R file for each chart.

# Each function must return a different type of visualization (e.g., you can only create one Scatter Plot).  
# Again, in your report you must describe why you included the chart (e.g., what it attempts to seeks to express), and what information it reveals. For each chart, we expect the following:
  
# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the question of interest and data type

library(dplyr)
library(ggplot2)

abbr_to_state <- function(abbreviation) {
  data.frame(abbr = c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE",
                      "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY",
                      "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS",  "MT",
                      "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH",
                      "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX",
                      "UT", "VA", "VT", "WA", "WI", "WV", "WY", "ZZ"),
             name = c("alaska", "alabama", "arkansas", "arizona", "california",
                      "colorado", "connecticut", "district of columbia",
                      "delaware", "florida", "georgia", "hawaii", "iowa",
                      "idaho", "illinois", "indiana", "kansas", "kentucky",
                      "louisiana", "massachusetts", "maryland", "maine",
                      "michigan", "minnesota", "missouri", "mississippi",
                      "montana", "north carolina", "north dakota", "nebraska",
                      "new hampshire", "new jersey", "new mexico", "nevada",
                      "new york", "ohio", "oklahoma", "oregon", "pennsylvania",
                      "puerto rico", "rhode island", "south carolina",
                      "south dakota", "tennessee", "texas", "utah", "virginia",
                      "vermont", "washington", "wisconsin", "west virginia",
                      "wyoming", "other")) %>%
    filter(abbr == abbreviation) %>%
    select(name) %>%
    pull()
}

render_third_chart <- function(df) {
  df <- df %>%
    group_by(LST) %>%
    summarize(responses=n()) %>%
    mutate(region = abbr_to_state(LST))
  df <- left_join(map_data("state"), df, by="region")
  ggplot(df, aes(long, lat, group = group)) +
    geom_polygon(aes(fill = responses), color = "white") +
    scale_fill_viridis_c(option = "D") +
    theme_void() +
    theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
    ggtitle("Number of Responses per State")
}
