library(styler)
library(lintr)
library(dplyr)

style_file("table_of_summary.R")
lint("table_of_summary.R")
# Aggregate Table of Summary criteria: (Ann's part)
# The second file you should save in your scripts/ directory should contain a
# function that takes in a dataset as a parameter, and returns a table of
# aggregate information about it. It must perform a groupby operation to show
# a dimension of the dataset as grouped by a particular feature (column).
# We expect the included table to:
# - Have well formatted column names
# - Only contain relevant information
# - Be intentionally sorted in a meaningful way
# Must describe why you included the table, and what information it reveals.

# - Introduces the table, explaining why the particular grouping calculation
# was performed (**2 points**)
# - Creates a summarized data frame to include as the table using
# `group_by()` (**2 points**)
# - Intentionally sorts the table in a relevant way (**1 point**)
# - Only displays relevant columns in the table (**1 point**)
# - Displays well formatted column names (**1 point**)
# - Successfully renders the table in the report using an appropriate
# package (e.g., don't just print out the data frame) (**1 point**)
# - Interprets information the table, honing in on important
# information (**2 points**)

# Explanation of grouping and sorting process:
# Step 1: "Picking initial appropriate columns"
# Read in the csv file and select only columns that I view as most
# important for now, including...
# - LST (State),
# - MHDIAGEVAL (Whether facilities offer mental health diagnostic evaluations),
# - FACILITYTYPE (What type of facility the organization is, such as community
# mental health center, residential treatment center, etc...),
# - FOCUS (The primary treatment focus of the facility, such as general health
# care, mental health treatment, mix of mental health and substance
# abuse treatment, etc...),
# - OWNERSHP (Organization ownership, such as private non-profit organization,
# private for-profit organization, etc...),
# - NOTREAT (Facilities offering none of the mental health treatment
# approaches, meaning that those responded with "yes" are facilities that
# do NOT have any mental health treatment approaches provided to patients
# such as psychotropic medications, therapies, or any disorder treatments),
# - SIGNLANG (Whether facilities that offer sign language services),
# - LANGPROV (Whether facilities offer services in languages other than
# English),
# - QUALREV (Whether facilities have regularly scheduled case review by an
# appointed quality review committee as part of their standard operating
# procedure),
# - OUTFUP (Whether facilities have client outcome follow-up after discarge as
# part if their standard operating procedure)
# These 10 columns are the columns I found most important from the raw dataset
# because they answer key questions regarding the quality of a health facility,
# such as their location and facility type, whether they offer diagnostics,
# what their main focus is, whether they have any mental health treatments,
# whether they provide services for individuals who are hard of hearing, deaf,
# or does not speak English, as well as whether they have regularly scheduled
# review sessions or client follow-ups to ensure quality control
# and customer care.
# NOTE: In later steps of the summary table making procedure,
# I would end up picking
# 1. LST (State)
# 2. MHDIAGEVAL (Offer_diagnostic_evaluations)
# 3. NOTREAT (NO_identified_mental_health_treatment_approaches),
# 4. SIGNLANG (Provides_sign_language),
# 5. LANGPROV (Provides services in languages other than English),
# 6. QUALREV (Regularly_scheduled_quality_reviews),
# 7. OUTFUP(Regularly_followup_after_discharge) as the categories that will
# be used to make up the final summary to compare different state's facilities'
# quality, for the other few columns talk about the facilities from an
# organization aspect such as what type of facility they are or what their
# organization ownership is of, but in this 1st step of the cleaning process
# I kept all 10 columns.

# Step 2: "Renaming column names and the row"
# The raw dataset had all of their string values represented as numbers
# (e.g. 0 = "No", 1 = "Yes", -1 = "Missing", and so I went through each
# of the 9 column and changed the numericals all to their appropriate
# strings values.
# I also renamed the columns with more comprehensive string names as they
# were very confusing to look at and decipher.
# LST became "State"
# MHDIAGEVAL became "Offer_diagnostic_evaluations",
# FACILITYTYPE became "Facility",
# FOCUS became "Primary_treatment_focus",
# OWNERSHP became "Organization_type",
# NOTREAT became "NO_identified_mental_health_treatment_approaches",
# SIGNLANG became "Provides_sign_language",
# LANGPROV became "Provides_languages_other_than_English",
# QUALREV became "Regularly_scheduled_quality_reviews",
# OUTFUP became "Regularly_followup_after_discharge"

# Step 3: "Finalize, group by, and summarize"
# After all of that cleaning process, I made the final decision to
# keep...
# 1. LST (State)
# 2. MHDIAGEVAL (Offer_diagnostic_evaluations)
# 3. NOTREAT (NO_identified_mental_health_treatment_approaches),
# 4. SIGNLANG (Provides_sign_language),
# 5. LANGPROV (Provides services in languages other than English),
# 6. QUALREV (Regularly_scheduled_quality_reviews),
# 7. OUTFUP(Regularly_followup_after_discharge) as the categories that will
# be used to make up the final summary to compare different state's facilities'
# quality, as the other few columns talk about the facilities from an
# organization aspect such as what type of facility they are or what their
# organization ownership is of I decided to not consider them as important
# columns for comparing the states' health facility qualities.
# I used grouped_by to group all the data by
# State, and the summarized the above 6 columns (excluding state as that is
# what I grouped by) by the counts of "Yes" to
# the respective columns (such as whether they have mental health treatments
# provided at the various facility or not, whether they provide sign language,
# other languages, whether they have regularly scheduled quality inspections,
# and whether they keep up with patients after discharge)
summary_table <-
  read.csv("../Data/mental_health_data.csv", stringsAsFactors = FALSE) %>%
  select(
    LST,
    MHDIAGEVAL,
    FACILITYTYPE,
    FOCUS,
    OWNERSHP,
    NOTREAT,
    SIGNLANG,
    LANGPROV,
    QUALREV,
    OUTFUP
  ) %>%
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
    "State" = LST,
    "Offer_diagnostic_evaluations" = MHDIAGEVAL,
    "Facility" = FACILITYTYPE,
    "Primary_treatment_focus" = FOCUS,
    "Organization_type" = OWNERSHP,
    "NO_identified_mental_health_treatment_approaches" = NOTREAT,
    "Provides_sign_language" = SIGNLANG,
    "Provides_languages_other_than_English" = LANGPROV,
    "Regularly_scheduled_quality_reviews" = QUALREV,
    "Regularly_followup_after_discharge" = OUTFUP
  ) %>%
  group_by(State) %>%
  summarize(
    Offer_diagnostic_evaluations =
      sum(Offer_diagnostic_evaluations == "Yes", na.rm = TRUE),
    NO_identified_mental_health_treatment_approaches =
      sum(NO_identified_mental_health_treatment_approaches == "Yes",
        na.rm = TRUE
      ),
    Provides_sign_language =
      sum(Provides_sign_language == "Yes", na.rm = TRUE),
    Provides_languages_other_than_English =
      sum(Provides_languages_other_than_English == "Yes", na.rm = TRUE),
    Regularly_scheduled_quality_reviews =
      sum(Regularly_scheduled_quality_reviews == "Yes", na.rm = TRUE),
    Regularly_followup_after_discharge =
      sum(Regularly_followup_after_discharge == "Yes", na.rm = TRUE)
  )
