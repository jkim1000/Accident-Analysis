# Accident-Analysis
R-Shiny dashboard

**Project Overview:**
An interactive web application that utilizes various visualization tools to provide users with insights and captivating findings about car accidents in the US. This application holds value for diverse audiences, including everyday drivers, traffic enforcement agencies, and even car insurance companies.

**Project Structure:**
The R-shiny app uses three core R files: global.R, ui.R, and server.R. Additionally, a helper.R file was created to preprocess the substantial raw data file (1GB) sourced from Kaggle. The helper.R script performs data cleaning and processing, storing the refined data in a CSV file for integration into the main project.

The global.R file streamlines the process by importing required libraries and data, thereby eliminating the need for repetitive imports. The user interface design is orchestrated by the ui.R file, which adopts a navbarPage layout for organization. The heart of the project, server.R, handles calculations and chart generation while ensuring proper rendering for user interface display.

**Features of the Application:**
The web app is thoughtfully divided into three principal sections: the Overview panel, Explore panel, and Data panel.

Overview Panel: This section presents a comprehensive view of car accidents across the nation. Users can interact with a US map displaying aggregated accident numbers for each state. It supports customization by allowing users to select different year ranges (2017 to 2019), accident counts or accidents per 1000 residents. Additionally, users can choose to view car accidents per capita to understand accidents relative to each state's population. The overview also spotlights the top three states with the highest accident rates based on user selections.

![image](https://github.com/jkim1000/Accident-Analysis/assets/67875208/6d28fafc-6847-470c-a29f-70ca831389e3)
Figure 1: Car accidents counts and counts per capita for each of the contingent US states.

Explore Panel: Users can dive deeper into specific state details within this section. It facilitates data slicing based on State, Date Range, and Severity Level. Visualizations include a leaflet map view that enables zooming into granular details like county, city, and highways. Top 3 counties are dynamically updated based on user preferences. The Explore panel also presents tabs for summary, variables, trends, and interesting findings. Noteworthy is the ability to analyze correlations between weather conditions and accidents through heatmaps and histograms.

![image](https://github.com/jkim1000/Accident-Analysis/assets/67875208/6987e1a8-3d2a-4097-b776-5683162ffe7a)
Figure 2: Car accidents map in New York City from 12/1/2019 to 12/31/2019.

Data Panel: This section provides access to all data used in the project, offering users the convenience of searching and exploring data of interest using Shiny's renderDataTable feature.

**Insights from Data Analysis:**
Analyzing the dataset uncovered intriguing insights. Despite California's apparent lead in total accident counts (approximately 523,000 from 2017 to 2019), South Carolina outpaced California in accidents per 1000 residents with around 28.19 accidents per 1,000 residents over three years. Oregon experienced a significant surge in accidents per 1000 residents, rising from 1.49 in 2017 to 5.38 in 2018, and further to 9.76 in 2019. The top seven states with the highest accidents per 1000 residents and their three-year changes are noteworthy.

Other findings include a concentration of accidents on major highways and in urban areas. The analysis also indicated higher accident occurrences in October, with more severe accidents happening during the night. Exploring weather variables revealed a higher frequency of accidents during periods of increased humidity. However, the author acknowledges the need for further analysis, including understanding humidity distribution and dimension reduction to unearth correlations between weather variables and accident occurrences.

**Conclusion and Future Prospects:**
Constructing this interactive app was an engaging experiment that provided valuable insights into US car accidents. The project underscored the significance of data cleaning, exception handling, and efficient data storage for effective application development. In the future, obtaining additional relevant data, such as driver counts and average driver ages, will enhance the project's depth. Incorporating dimension reduction techniques to address correlated weather variables could reveal deeper relationships between weather and accidents.

The exploration of car accidents in the US exemplifies the potential of data-driven insights in addressing real-world issues and demonstrates the author's proficiency in data analysis and application development.
