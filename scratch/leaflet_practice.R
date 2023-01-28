library(tidyverse)
library(leaflet)

filtered_lakes <- read_csv("shinydashboard/data/lake_data_processed.csv")

# practice filtering
unique_lakes_filtered <- unique_lakes %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

leaflet() %>% 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery") %>% 
  
  # set view of AK
  setView(lng = -152, lat = 70, zoom = 6) %>% 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>% 
  
  # add markers
  addMarkers(data = unique_lakes,
             lng = unique_lakes$Longitude,
             lat = unique_lakes$Latitude,
             popup = paste(
               "Site Name:", unique_lakes$Site, "<br>",
               "Elevation", unique_lakes$Elevation, "meters (above SL)", "<br>",
               "Average Depth", unique_lakes$AvgDepth, "meters", "<br>",
               "Average Temperature", unique_lakes$AvgTemp, "deg Celcius"
             ))


