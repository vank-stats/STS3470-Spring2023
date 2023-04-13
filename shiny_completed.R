# This is a template for an interactive applet. At the top we can load any
# R packages that we will use.

library(shiny)
library(ggplot2)



# User interface (ui) section. Here we will define what the user can interact
# with (sidebarPanel) and what they will see (mainPanel).

ui <- fluidPage(

    titlePanel("Central Limit Theorem Applet"),
    
    
    # Define any "widgets" on the left the user can use to customize output
    
    sidebarLayout(
      
        sidebarPanel(

          numericInput(inputId = "df",
                       label = "Choose a degrees of freedom",
                       value = 3),
          
          sliderInput(inputId = "n",
                      label = "Choose your sample size",
                      min = 5,
                      max = 50,
                      value = 30,
                      step = 5),
          
          selectInput(inputId = "color",
                      label = "Choose line color on histogram",
                      choices = c("red", "blue", "white"),
                      selected = "white"),

          radioButtons(inputId = "fill",
                       label = "Choose color of bars on histogram",
                       choices = c("gray", "gold", "orange"),
                       selected = "gray"),
        ),

        
        # Specify output the user sees on the right
        
        mainPanel(
          plotOutput("graphA"),
          textOutput("textA"),
          br(),
          plotOutput("graphB"),
          textOutput("textB"),
        )
    )
)





# Server section. Here we will use the user inputs to create our specified
# outputs.

server <- function(input, output) {
   
  # Use renderPlot to make a graph - make sure output$__ matches something in
  # mainPanel in ui section
  
  output$graphA <- renderPlot({
    
    a <- ggplot() +
      xlim(c(0, 3 * input$df)) +
      stat_function(fun = dchisq, args = list(df = input$df)) +
      labs(title = paste("Chi-squared Population (", input$df, "df )")) +
      theme_bw()
    a
    
  })

  
  # Use renderText to display text - make sure output$__ matches 
  # something in mainPanel in ui section
  
  output$textA <- renderText({
    
    ourtext <- paste("A chi-squared distribution with", 
                     input$df, 
                     "degrees of freedom has a mean of", 
                     input$df, 
                     "and a standard deviation of", 
                     round(sqrt(2 * input$df), 2)
                     )
    ourtext
    
  })
  
  
  # Here we are adding a second graph
  
  output$graphB <- renderPlot({
    
    set.seed(1126)
    xbars <- replicate(1000, mean(rchisq(n = input$n, df = input$df)))
    
    b <- ggplot(NULL, aes(x = xbars)) +
      xlim(c(0, 3 * input$df)) +
      geom_histogram(color = input$color, fill = input$fill) +
      theme_bw()
    b
    
  })
  
  
  # And a second set of text 

  output$textB <- renderText({
    
    newtext <- paste("The Central Limit Theorem says that if we take many",
                     "random samples of n = ",
                     input$n,
                     "from a Chi-squared distribution with",
                     input$df,
                     "degrees of freedom, then the distribution of sample means",
                     "will have a mean of",
                     input$df,
                     "and a standard deviation of",
                     round(sqrt(2 * input$df / input$n), 2),
                     ". For large enough sample sizes, the distribution will",
                     "follow a normal distribution.")
    newtext
    
  })
  
}




# This code runs the shiny app. You don't need to change this.

shinyApp(ui = ui, server = server)