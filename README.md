# China Pollution Shiny App

A shiny app analysis of pollution levels in Chinese cities.

Air pollution in China is very high compared with most Western countries. The extent of this air pollution is difficult to track, as official government statistics are often unreliable.

The US state department has recorded and published hourly [PM2.5 (a measure of air pollution)](http://www3.epa.gov/pmdesignations/faq.htm#0) data for Beijing since 2008 and for Chengdu, Guangzhou, Shanghai and Shenyang since 2011.

This app allows you to look at trends in pollution levels in China for each year that there is available data. It includes a graph of daily averages and a table showing various monthly summary statistics.

Original data and disclaimers can be found at the [US state department website](http://www.stateair.net/web/historical/1/1.html).

# Usage

An online version of this analysis can be found at https://thmcmahon.shinyapps.io/china_pollution.

This analysis can be run offline using RStudio. 

To update the data, download the [raw data files](http://www.stateair.net/web/historical/1/1.html) and put them in a folder called `"raw_data"` and then run the `load_data.R` script.
