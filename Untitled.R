ui <- navbarPage(
    
  title = "LTER Animal Data Explorer",,
  
  tabPanel(title = "About this App",
           
           "background info here"
           
           ), # END page 1 tabPanel
  
  # page 2: data tabPanel
  tabPanel(title = "Explore the Data"
           
           #tabsetPanel ----
           tabsetPanel(
             
             # trout tab ----
             tabPanel( title = "Trout",
                       
                       # trout siebarLayout ----
                       sidebarLayout(
                         
                         sidebarPanel(
                           
                           
                         )
                         
                       )
               
               
               
             )
             
           )
           
           )
  
  
  
  
)