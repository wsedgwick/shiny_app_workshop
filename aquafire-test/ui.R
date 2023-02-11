ui <- fluidPage(
  
  titlePanel(""),
    fluidPage(
      fluidRow(column(6,
                      h1("Aquafire")),
               column(6,
                      HTML("<a href='https://www.tnc.org/'><img src='tnc_logo.png' align= 'right' height= '60' width = '60' alt='This is The Nature Conservancy logo'/></a>")))),
  
  # Navigation Bar ----
  navbarPage("",
             tabPanel("About", icon = icon("info-circle"),
                       fluidPage(
                         fluidRow(
                           
                           # Some nice images or maps about our project
                           
                         ), # End fluidRow
                         
                         # Background ----
                         h1("Background"),
                         
                         fluidRow(
                           column(12, p("Although there has been extensive research on both groundwater dependent ecosystems and wildfire hazard, little research has been done to understand and quantify the relationship between the two."),
                                  )
                         ), # End Background
                         
                         h1("Significance"),
                         
                       ), # End fluidPage
                      
                      ), # End Tab Panel
             
             # Map Bar ----
             navbarMenu("Spatial Analysis", icon = icon("earth"),
                        
                        # California Map ----
                        tabPanel(title = "California",
                                 
                                 # sidebarLayout ----
#                                  sidebarLayout(
                                   
                                   sidebarPanel(width = 3,
                                                
                                                # Put inputs & variables to change here!
                                                # GDEs, Wildfire Hazard
                                                "For California spatial analysis inputs"
                                                
                                                ), 
#                                  ), # End sidebarLayout ----
                        ), # End tabPanel
                        
                        
                        mainPanel(leafletOutput(outputId = "leaflet_base")
                          
                        ), # End mainPanel
                        
                        tabPanel(title = "Santa Barbara County",
                                 
                                 # sidebarLayout for county map----
#                                 sidebarLayout(
                                

                                 sidebarPanel(width = 3,
                                              
                                              
                                              # Put inputs & vartiables here
                                              "For County-level spatial analysis inputs"
                                              
                                              ),
#                                 ), # End sidebarLayout
#                                  position = ("left"),

                        mainPanel(
                          
                          "Map of County/Counties"
                          
                        ),

                                 ), # End tabPanel

                        ), # End navbarMenu for Spatial Analysis
    
    
  ), # End Navigation Bar
  
)



# sidebarLayout(
#   sidebarPanel(
#     
#     # inputs here
#     "inputs here"
#   ),
#   mainPanel(
#     
#     #outputs here
#     "outputs here"
#   )
# )