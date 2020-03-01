<<<<<<< HEAD
Domain of interest
As we've discussed, data science can expose underlying patterns in any domain that uses or collects data (which is nearly any domain). Anything from European Family Royalties (Links to an external site.) to how people spend their days (Links to an external site.), data can expose interesting (and actionable) patterns. In this section, you'll identify a domain that you are interested in (e.g., music, education, dance, immigration -- any field of your interest) and answer the following questions in your README.md file:

Domain of Interest: Mental Health

Why are you interested in this field/domain?
Mental health is a huge topic that has consistently been overlooked despite how widespread the issue of mental health disorders is. There is also a lack of treatment and information for many mental health disorders in a multitude of countries. People across different cultures, languages, socioeconomic classes and ages but not enough individuals talk about it. Therefore, we wanted to address this stigmatized topic and analyze the data for any new insight into mental health issues.

What other examples of data driven projects have you found related to this domain (share at least 3)?
1. https://ourworldindata.org/mental-health
    - This is a report from _Our World in Data_, an organization based at the University of Oxford to use research and data to
      help solve some of the world's problems. They compiled a large report presenting estimates of mental health disorder
      prevalence and associated disease burden and produced a lot of interesting interactive visualizations.
2. https://vizhub.healthdata.org/gbd-compare/
    - This is a large group of visualizations from the _Institute for Health Metrics and Evaluation_, a population health
      research center at UW Medicine. It allows us to compare different factors and the prevalence of various diseases and
      disorders, including mental health disorders. There are a lot of different visualization options, including line plots,
      bar graphs, tree maps, and geospatial maps.
3. https://mihiriyer.shinyapps.io/MentalHealth/
    - This is an R Shiny app that visualizes mental health data from the U.S. Departments of Veterans Affairs and their
      Northeast Program Evaluation Center. They released statistics in April 2016 for fiscal year 2015 on "the
      prevalence, mental health utilization, non-mental health utilization, mental health workload, and psychological
      testing of Veterans with a possible or confirmed diagnosis of mental illness." The app allows you to see different
      graphs and specific parts of the data.

What data-driven questions do you hope to answer about this domain (share at least 3)?
1. Are different mental health issues more prevalent in certain areas?
2. Are there any differences in quality of mental health care facilities between states?
3. Do different states focus on different aspects of mental health?

We strongly suggest that you complete this section first, discussing what you might want to learn, then move forward with the data discovery process.

Finding Data
We are lucky enough to live in a time when there is lots of publicly available data made possible by governments, journalists, academics, and companies. In this section, you will identify and download at least 3 sources of data related to your domain of interest described above (into a folder you create called data/). You won't be required to use all of these sources, but it will give you practice discovering data. If your data is made available through a Web API, you don't need to download it. For each source of data, provide the following information:

Where did you download the data (e.g., a web URL)?
1. N-MHSS-2018: https://www.datafiles.samhsa.gov/study-dataset/national-mental-health-services-survey-2018-n-mhss-2018-ds0001-nid18767
This data set was downloaded from the Substance Abuse and Mental Health Archive.
2. Connecticut Mental Health Survey (2015-2016): http://data.ctdata.org/visualization/mental-health?v=table&f={%22Variable%22:%20%22Mental%20Health%22,%20%22Region%22:%20%22Connecticut%22,%20%22Measure%20Type%22:%20%22Percent%22,%20%22Year%22:%20%222015-2016%22}
This data set was downloaded from the Substance Abuse and Mental Health Archive.
3. National Veteran Health Equity Report (2019): https://catalog.data.gov/dataset/national-veteran-health-equity-report-fy13
This data set was downloaded from the national database, data.gov.

How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
1. The statistics of the N-MHSS-2018 data set was collected by the National Mental Health Services Survey of 2018. All of this data was collected from all known mental health treatment services across the United States. Statistics on the mental health services were gathered on the location, characteristics and utilization of providers for mental health in America via mail, telephone and online.
2. The data from the Connecticut Mental Health Survey was collected by the Substance Abuse and Mental Health Services Administration (SAMHSA) as part of the National Survey on Drug Use and Health.
-- found information, need to put on
3. The statistics of the National Veteran Health Equity Report was collected by the Veterans Health Affairs Office of Health Equity and pulled from the VA JSON Harvest Source Record. The data was generated by monitoring and evaluating veterans who were considered in vulnerable condition on a holistic basis of socio-demographics and rates of diagnosed health conditions.

How many observations (rows) are in your data?
1. The statistics of the N-MHSS-2018 data set has 11682 rows
2. The dataset from the Connecticut Mental Health Survey has 672 rows
3. The statistics of the National Veteran Health Equity Report has 1364 rows

How many features (columns) are in the data?
1. The statistics of the N-MHSS-2018 data set has 284 columns
2. The dataset from the Connecticut Mental Health Survey has 7 columns
3. The statistics of the National Veteran Health Equity Report has 33 columns

What questions (from above) can be answered using the data in this dataset?
1. For the data from the N-MHSS-2018 data set, we can answer several questions, such as:
-
-
-
2. For the data from the Connecticut Mental Health Survey data set, we can answer several questions, such as:
-
-
-
3. For the data from the National Veteran Health Equity Report data set, we can answer several questions, such as:
-
-
-
=======
# Final Project

## Domain of Interest

- **Why are you interested in this field/domain? (2-3 sentences)**
    - To explore wage trends in Washington
    - To explore wage trends based on age, gender, etc.
    - To better understand possible discrimination of wages based on gender, race, etc.

- **What other examples of data driven projects have you found related to this domain (share at least 3)?**
    - [_Income by Location_](https://datausa.io/profile/geo/washington#income_geo) by datausa.io. 
        - Visualizes the median household income by WA counties. Visualization can be filtered by race.
    - [ US Adult Income ](https://www.kaggle.com/johnolafenwa/us-census-data?fbclid=IwAR3FprwS3f81WjtXvxtDKwnhXCzRj4Ix1I0jnoHzsocGfDSO_09CYHHumL0#adult-training.csv) by kaggle.com.
        - Visualizes income and how it relates to marital status, education level, age, race, gender, among others and can be sorted by these variables
    - [ United States Census ](https://www.census.gov/data/tables/time-series/demo/income-poverty/historical-income-people.html) by the City of Seattle.
        - Visualizes the average hourly rate according to race, gender, and region from 2002-2019. (Tables P-6)

- **What data-driven questions do you hope to answer about this domain (share at least 3)?**
    - How do wage growth trends differ by location/demographic?
        - Can create visualizations of change in year-to-year median income by location and race to show similarities or differences.
    - How do different variables affect how much money a person makes?
        - Shows what variables directly translate to a difference in income and what do not affect it.
    - Has there there been an improvement or deterioration in the pay gap based on region, gender, and ethnicity?
        - Provides insight into what trends are occuring throughout the nation for various people based on time.

***
## Finding Data (at least 3 datasets)

### _Income by Location.csv_
- **Where did you download the data (e.g., a web URL)?**
    - https://datausa.io/api/data?Geography=04000US53:children&measure=Household%20Income%20by%20Race,Household%20Income%20by%20Race%20Moe&drilldowns=Race
    - https://www.kaggle.com/johnolafenwa/us-census-data?fbclid=IwAR3FprwS3f81WjtXvxtDKwnhXCzRj4Ix1I0jnoHzsocGfDSO_09CYHHumL0#adult-training.csv
    - https://www.census.gov/data/tables/time-series/demo/income-poverty/historical-income-people.html

- **How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**
    - This data was collected by the [US Census](https://www.census.gov/en.html), through the [American Community Survey](https://www.census.gov/programs-surveys/acs/methodology.html) (ACS). It is generated through a survey that is distributed nationally and samples about 3.54 million addresses each year. The survey aims to collect data on social, economic, housing, and demographic characteristics of Americans.
    - This data was also collected by the US Census and was collected to show all of these variables and not necessarily how they relate.
    - This data was also collected by the US census and is designed to divide the public into variables ie. location, gender, ethnicity, etc. to view the overall trend as society progresses.
- **How many observations (rows) are in your data?**
    - 935
    - 32562
    - 1430

- **How many features (columns) are in the data?**
    - 9
    - 15
    - 5

- **What questions (from above) can be answered using the data in this dataset?**
    - How wage growth trends differ by location/demographic.
    - How income level is relatedto different variables of a person.
    - How wages are changing based on the year and is the overall discriminatory trend increasing or decreasing.
    

### _next csv here_
- **Where did you download the data (e.g., a web URL)?**
- **How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**
- **How many observations (rows) are in your data?**
- **How many features (columns) are in the data?**
- **What questions (from above) can be answered using the data in this dataset?**
>>>>>>> f92efc2596f3fd313d9607fdd013b84ad4042dcb
