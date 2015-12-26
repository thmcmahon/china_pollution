
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Air pollution in China"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    selectInput("city",
                "Select a city:",
                choices = c("Beijing", "Guangzhou", "Chengdu", "Shanghai",
                            "Shenyang")),
    h4("Description"),
    p("Air pollution in China is very high compared with most Western countries. 
      The extent of this air pollution is difficult to track, as official 
      government statistics are often unreliable."),
    p("The US state department has recorded and published hourly",
      a(href = "http://www3.epa.gov/pmdesignations/faq.htm#0", "PM2.5"), 
      "(a measure of air pollution) data for Beijing since 2008 and for Chengdu,
      Guangzhou, Shanghai and Shenyang since 2011."),
    p("This app allows you to look at trends in pollution levels in China for
      each year that there is available data. It includes a graph of daily 
      averages and a table showing various monthly summary statistics."),
    p("Original data and disclaimers can be found at the ", 
      a(href = "http://www.stateair.net/web/historical/1/1.html",
        "US state department website.")
      )
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3("Trends in air pollution levels as measured by PM2.5"),
    plotOutput(outputId = "plot"),
    h3("Monthly PM2.5 Summary Statistics"),
    dataTableOutput(outputId = "table")
  )
))
