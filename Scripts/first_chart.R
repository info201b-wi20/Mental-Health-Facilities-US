library(dplyr)
library(ggplot2)
library(plotly)

# Chart Script(s) criteria: (Ann's part)
# You should write functions that take in your dataset as a parameter,
# and return a visualization of that data.
# This will allow you to call your charting function from your index.Rmd
# file, keeping your code much easier to read and update. Create a separate
# .R file for each chart.

# Each function must return a different type of visualization
# (e.g., you can only create one Scatter Plot).
# Again, in your report you must describe why you included the chart
# (e.g., what it attempts to seeks to express), and what information
# it reveals. For each chart, we expect the following:

# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the
# question of interest and data type

state_vs_diagnostics_barchart <- function(df) {
  ggplotly(
    df %>%
      select(LST, MHDIAGEVAL) %>%
      within(MHDIAGEVAL <- factor(MHDIAGEVAL, labels = c("No", "Yes"))) %>%
      rename(
        "Offer_diagnostic_evaluations" = MHDIAGEVAL,
        "State" = LST
      ) %>%
      group_by(State) %>%
      summarize(
        Offer_diagnostic_evaluations =
          sum(Offer_diagnostic_evaluations == "Yes", na.rm = TRUE)
      ) %>%
      ggplot(aes(x = State, y = Offer_diagnostic_evaluations)) +
      geom_bar(stat = "identity") +
      labs(
        y = "Count of facilities providing mental health diagnostics",
        x = "State",
        title = "Count of facility providing mental health diagnostics by State"
      )
  )
}
