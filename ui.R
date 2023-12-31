library(shiny)
library(shinythemes)

fluidPage(
  theme = shinytheme("journal"),
  tags$head(
    tags$style(
      HTML(".navbar .navbar-nav {float: right}"),
      HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                                                  background: #E84646;
                                                  border-top: 1px solid #E84E4E ;
                                                  border-bottom: 1px solid #E84E4E ;}
                                 .irs-from, .irs-to, .irs-single { background: #E84646 }"
      ), # style for slider bars
      type = "text/css", 
      "body {padding-top: 70px;}"
    )),
  navbarPage(
    title = "US CAR ACCIDENTS",
    id = "nav",
    position = "fixed-top",
    tabPanel("OVERVIEW", icon = icon('map'),
             fluidRow(
               column(8,
                 h2(strong("Car Accidents in the U.S.")),
                 h4(
                   "The map aggregates 2.6 million US car accident records from January 2017 to December 2019."
                 ),
                 "excluding Hawaii and Alaska.",
                 htmlOutput("USmap")),
               column(3,
                 br(),
                 br(),
                 radioButtons(
                   "map",
                   label = h4("CHOOSE FROM:"),
                   choices = list("Count of Accidents" = "Count",
                                  "Accidents per 1k residents" = "proportion"),selected = "Count"),
                 sliderInput("year", label = h4("YEAR RANGE"), min = 2017, 
                             max = 2019, value = c(2017, 2019), sep = ""),
                 "Hover over the states to see more detail.",
                 hr(),
                 wellPanel(style = "background: #E80000",
                           h4(strong(htmlOutput(
                             "top1"
                           ))), ),
                 wellPanel(style = "background: #E85E5E",
                           h4(strong(htmlOutput(
                             "top2"
                           )))),
                 wellPanel(style = "background: #E8AFAF",
                           h4(strong(htmlOutput(
                             "top3"
                           )))),
                 br()),
               column(1, "")
             )),
    
    tabPanel("EXPLORE",icon = icon("poll"),
    mainPanel(
      fluidRow(column(2,
               selectizeInput(inputId = "State",
                              label = "SELECT A STATE:",
                              choices = unique(data_state$State))),
               column(3,
                      dateRangeInput("daterange", "DATE RANGE:",
                                     start  = "2019-12-01",
                                     end    = "2019-12-31",
                                     min    = "2007-01-01",
                                     max    = "2019-12-31",
                                     format = "M/dd/yyyy",
                                     separator = " - ")
                      ),
               column(3,
                      checkboxGroupInput(
                        "Severity",
                        label = "FILTER BY SEVERITY:", #style="color:#FF6060;"
                        choices = (unique(sort(my_data$Severity))),inline = TRUE,
                        selected = 0:4)
               )),
      br(),
    tabsetPanel(type = "tabs",id = "chart_tabs",
    tabPanel("MAP",
      fluidRow(column(2,br(),br(),h3("TOP 3 COUNTIES",style="color:#FF6060;"),br(),
          wellPanel(style = "background: #E80000",
                    h4(strong(
                      htmlOutput("top1county")
                    ))),
          wellPanel(style = "background: #E85E5E",
                    h4(strong(
                      htmlOutput("top2county")
                    ))),
          wellPanel(style = "background: #E8AFAF",
                    h4(strong(
                      htmlOutput("top3county")
                    )))
        ),
        column(
          10,
          br(),
          "Zoom in to view more details",
          h3(leafletOutput(
            "leaflet", width = 1050, height = 450
          ),
          style = "text-align: right;"))
      )),
    tabPanel("SUMMARY",
      fluidRow(
        column(2,
          br(),
          br(),
          br(),
          radioButtons(
            "bar",
            label = h5(strong("Choose from:")),
            choices = list("Count of Accidents" = "Count","Accidents per 1k residents" = "Proportion"),
            selected = "Count"),
          br(),
          br(),
          br(),
          "Monthly Average is calculated using data from 2017 to 2019.",
        ),
        column(5,
               plotOutput("bar")
               ),
        column(5,
               plotOutput("bar2")
               )
      )),
    tabPanel("VARIABLES",
             fluidRow(
               column(
                 2,
                 br(),
                 "How does weather affect the occurance of the accidents?",
                 br(),
                 br(),
                 h5(strong("HEAT MAP/DENSITY GRAPH")),
                 selectizeInput(
                   inputId = "var1",
                   label = h5(strong("Select a variable:")),
                   choices = var_option
                 ),
                 selectizeInput(
                   inputId = "var2",
                   label = h5(strong("Select another variable:")),
                   choices = var_option
                 )),
               column(5,
                      plotOutput("heatmap")),
               column(5,
                      plotOutput("density"))
             )),
    tabPanel("TRENDS", width = 1,
             fluidRow(br(),h3("Number of Car Accidents Over Time", style = "text-align: center"),
                      htmlOutput("timeseries"))),
    tabPanel("INTERESTING FINDINGS",
             fluidRow(align = "center",br(),
               h3("Car Accidents per capita vs. Car Insurance Premium"),
               "Numbers represent the annual average.",
               htmlOutput("insurance"),
               htmlOutput("insurance_desc")
             ))),style='width: 1300px; height: 1000px')), 
    navbarMenu(
      "DATA",
      icon = icon("database"),
      tabPanel(
        "ACCIDENTS DATA",
        fluidRow(column(3,
          "Dataset is very large with 3 million records. "),
          selectizeInput(
            inputId = "State2",
            label = h4(strong("Choose a state:")),
            choices = unique(data_state$State)
          )),
        fluidRow(
          uiOutput("url_kaggle", align="right"),
          hr(),
          DT::dataTableOutput("table")
        )
      ),
      tabPanel("POPULATION DATA",
               br(),h4("POPULATION DATA"),br(),
               fluidRow(column(6,
                               uiOutput("url_population", align="left"),
                               hr(),
                 DT::dataTableOutput("table_population")
               ))),
      tabPanel("INSURANCE DATA",
               br(),h4("INSURANCE DATA"),br(),
               fluidRow(column(6,
                               uiOutput("url_insurance"),
                               hr(),
                               DT::dataTableOutput("table_insurance"))))
    )

  ))
