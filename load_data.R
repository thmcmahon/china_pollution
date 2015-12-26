library(readr)
library(lubridate)

load_data <- function() {
  # Reads in the pm25 data downloaded from the american embassy for selected
  # chinese cities.
  #
  # The raw data can be downloaded from:
  # http://www.stateair.net/web/historical/1/1.html
  files <- paste('raw_data/', list.files(path = "raw_data"), sep = "")
  # Skip the redundant date columns and the value column because it freaks R out
  df <- do.call(rbind, 
                lapply(files, read_csv, skip = 3, col_types = "?_ciii_i__?")
  )
  names(df) <- c("city", "date_time", "year", "month", "day", "pm25", "qc_name")
  df$date_time <- ymd_hm(df$date_time)
  # Make correct factor
  factor_vars <- c("city", "qc_name")
  df[factor_vars] <- lapply(df[factor_vars], as.factor)
  return(df)
}

df <- load_data()

saveRDS(df, file = "data/china_pm25.Rds")