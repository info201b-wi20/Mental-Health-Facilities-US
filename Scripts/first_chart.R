# Chart Script(s) criteria: (Ann's part)
# You should write functions that take in your dataset as a parameter, and return a visualization of that data. This will allow you to call your charting function from your index.Rmd file, keeping your code much easier to read and update. Create a separate .R file for each chart.

# Each function must return a different type of visualization (e.g., you can only create one Scatter Plot).  Again, in your report you must describe why you included the chart (e.g., what it attempts to seeks to express), and what information it reveals. For each chart, we expect the following:
  
# Proper labels/titles/legends
# Intentional chart type and encoding selection based on the question of interest and data type

summary_table <- 
  read.csv("../Data/mental_health_data.csv", stringsAsFactors = FALSE) %>%
  select(MHDIAGEVAL) %>%
  within(MHDIAGEVAL <- factor(MHDIAGEVAL, labels = c("No", "Yes"))) %>%
  within(FACILITYTYPE <- factor(FACILITYTYPE, labels = c(
    "Psychiatric hospital", 
    "Separate inpatient psychiatric unit of a general hospital", 
    "Residential treatment center for children",
    "Residential treatment center for adults", 
    "Other type of residential treatment facility",
    "Veterans Administration medical center (VAMC)",
    "Community mental health center (CMHC)",
    "Partial hospitalization/day treatment facility",
    "Outpatient mental health facility",
    "Multi-setting mental health facility",
    "Other"
  ))) %>%
  within(FOCUS <- factor(FOCUS, labels = c(
    "Mental health treatment",
    "Mix of mental health and substance abuse treatment",
    "General health care",
    "Other service focus"
  ))) %>%
  within(OWNERSHP <- factor(OWNERSHP, labels = c(
    "Private for-profit organization",
    "Private non-profit organization",
    "Public agency or department"
  ))) %>%
  within(NOTREAT <- factor(NOTREAT, labels = c(
    "Missing",
    "No",
    "Yes"
  ))) %>%
  within(SIGNLANG <- factor(SIGNLANG, labels = c(
    "Missing",
    "No",
    "Yes"
  ))) %>%
  within(LANGPROV <- factor(LANGPROV, labels = c(
    "NA",
    "Missing",
    "Staff who speak a language other than English",
    "On-call interpreter brought in when needed",
    "Both staff and on-call interpreter"
  ))) %>%
  within(QUALREV <- factor(QUALREV, labels = c(
    "Missing",
    "No",
    "Yes"
  ))) %>%
  within(OUTFUP <- factor(OUTFUP, labels = c(
    "Missing",
    "No",
    "Yes"
  ))) %>%
  rename(
    "Offer_diagnostic_evaluations" = MHDIAGEVAL,
  ) %>%
  group_by(State) %>%
  summarize(
    Offer_diagnostic_evaluations = 
      sum(Offer_diagnostic_evaluations == "Yes", 
          na.rm = TRUE),
    NO_identified_mental_health_treatment_approaches =
      sum(NO_identified_mental_health_treatment_approaches == "Yes",
          na.rm = TRUE),
    Provides_sign_language = 
      sum(Provides_sign_language == "Yes", na.rm = TRUE),
    Regularly_scheduled_quality_reviews =
      sum(Regularly_scheduled_quality_reviews == "Yes", na.rm = TRUE),
    Regularly_followup_after_discharge =
      sum(Regularly_followup_after_discharge == "Yes", na.rm = TRUE))
