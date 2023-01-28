ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
  ), # END page 1 tabPanel
  
  # page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           #tabsetPanel ----
           tabsetPanel(
             
             # trout tab ----
             tabPanel(title = "Trout", # START HERE
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebar panel ----
                        sidebarPanel(
                          
                        # channel type pickerInput ----
                        shinyWidgets::pickerInput(inputId = "channel_type_input",
                                    label = "Select channel type(s):",
                                    choices = unique(clean_trout$channel_type),
                                    options = pickerOptions(actionsBox = TRUE),
                                    selected = c("C", "S"),
                                    multiple = TRUE
                                    ), # END pickerInput
                          
                        # checkboxGroupButtonInput
                        checkboxGroupButtons(inputId = "section_input",
                                             label = "Select a sampling section(s):",
                                             choices = unique(clean_trout$section), # refers to CC and OG forests
                                             selected = c("clear cut forest", "old growth forest"),
                                             individual = FALSE, justified = TRUE,
                                             checkIcon = list(yes = icon("ok", lib = "glyphicon"),
                                                              no = icon("remove", lib = "glyphicon"))
                                             ) # END checkboxGroupButtons
                        
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot") %>% withSpinner(type = 2, color = "blue", color.background = "yellow")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tab
             
             #penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebar panel ----
                        sidebarPanel(
                          
                          "penguin inputs here"
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin output here"
                          
                        ) # END penguin mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ) # END penguin tabPanel
             
           ), # END tabsetPanel
           
           "data here"
           
  )
)



