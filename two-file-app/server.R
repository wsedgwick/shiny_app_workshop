server <- function(input, output) {
  
  # only outputs are saved in the server!!
  output$trout_scatterplot <- renderPlot({
    
    # trout df ----
    trout_filtered_df <- reactive({
      
      # for default options, to tell the user what to do
      validate(
        need(length(input$channel_type_input) > 0, "Select at least one channel type."),
        need(length(input$section_input) > 0, "Select at least one forest section.")
      )
      
      # below makes the plot interactive, picker input id is channel_type_input
      trout_filtered_df <- clean_trout %>% 
        filter(channel_type %in% c(input$channel_type_input)) %>% 
        filter(section %in% c(input$section_input))
      
    })
    
    
    
    # plot trout ----
    # must use parentheses for the data argument!!
    ggplot(data = trout_filtered_df(), aes(x = length_mm, y = weight_g,
                                   color = channel_type)) +
      geom_point(alpha = 0.7, size = 2) +
      scale_color_manual(values = c("R" = "blue", "C" = "purple",
                                    "S" = "black", "P" = "yellow",
                                    "SC" = "pink", "I" = "orange",
                                    "IP" = "red"))
    
  }, alt = "some alt text will live here"
  
  )
  
  
}