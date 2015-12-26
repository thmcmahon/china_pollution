
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)

pollution <- readRDS('data/china_pm25.Rds') %>%
  filter(qc_name == "Valid", pm25 >= -5)

shinyServer(function(input, output) {
  # Show a table of monthly values to accompany graph
  output$table <- renderDataTable({
    # Select city to examine based on dropdown from input
    monthly <- pollution %>%
      filter(city == input$city) %>%
      group_by(year, month) %>%
      summarise(mean = mean(pm25), max = max(pm25), min = min(pm25),
                median = median(as.numeric(pm25)))

    # Pretty up the output
    monthly$mean <- round(monthly$mean, digits = 2)
    monthly$month <- month(monthly$month, label = TRUE)
    monthly
  })

  output$plot <- renderPlot({
    daily <- pollution %>%
      filter(city == input$city) %>%
      group_by(year, month, day) %>%
      summarise(count = n(), mean = mean(pm25))

    daily$date <- with(daily, ymd(paste(year, month, day, sep = "-")))

    plot_title <- paste("Daily Average PM2.5 levels for", input$city)
    qplot(date, mean, data = daily, geom = c("point", "smooth"),
          xlab = "Date", ylab = "Average PM2.5", main = plot_title,
          alpha = 0.5) +
      theme_bw() +
      theme(legend.position = "none")
  })
})
