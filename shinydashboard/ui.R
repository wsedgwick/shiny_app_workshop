# dashboard header -------------------------
header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
) # END dashboardHeader

# dashboard sidebar ---------------------------
sidebar <- dashboardSidebar(
  
  
  # sidebarMenu
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboard sidebar

# dashboard body ----------------------------
body <- dashboardBody(
  
  # set theme ----
  fresh::use_theme("fresh_theme.css"),
  
  #tabItems() ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column ----
            column(width = 6,
                   box(width = NULL,
                       
                       title = tagList(icon("droplet"), tags$strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       tags$img(src = "map.jpg",
                                alt = "here is some alt text",
                                style = "max-width: 100%;"),
                       tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org", "FCWO")),
                               style = "text-align: center;") # adds a static image
                       
                       ) # END left-box
                   
                   ), # END left-column
            
            # right-hand column ----
            column(width = 6,
                   
                   # top fluid row ----
                   fluidRow(
                     
                     box(width = NULL,
                         
                         title = tagList(icon("user"), tags$strong("Citations")),
                         includeMarkdown("text/citation.md")
                         
                         ) # END box
                     
                   ), # END top fluid row ----
                   
                   # bottom fluidRow
                   fluidRow(
                     
                     box(width = NULL,
                         
                         title = tagList(icon("note-sticky"), tags$strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         
                         )
                   )
                   
                   ) # END right-hand column
            
            ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInput
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                  
                  ), # END input box
              
              #leaflet box ----
              box(width = 8,
                  
                  title = tags$strong("Monitored lakes within Fis Creek Watershed:"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") %>% withSpinner(type = 1, color = "#742361")
                  
                  ) # END leaflet box
              
              
            ) # END fluidRow
            
            ) # END dashboard tabItem
    
  ) # END tabItem
  
) # END dashboardBody

# combine all ----------------------------
dashboardPage(header, sidebar, body)
