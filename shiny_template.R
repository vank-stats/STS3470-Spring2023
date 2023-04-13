# This is a template for an interactive applet. At the top we can load any
# R packages that we will use.

library(shiny)
library(ggplot2)



# User interface (ui) section. Here we will define what the user can interact
# with (sidebarPanel) and what they will see (mainPanel).

ui <- fluidPage(

    titlePanel("App title goes here"),
    
    
    # Define any "widgets" on the left the user can use to customize output
    
    sidebarLayout(
      
        sidebarPanel(

          numericInput(inputId = "numeric_id",
                       label = "Label above numeric box",
                       value = 0),
          
          sliderInput(inputId = "slider_id",
                      label = "Label above slider box",
                      min = 5,
                      max = 50,
                      value = 5,
                      step = 5),
          
          selectInput(inputId = "dropdown_id",
                      label = "Label above dropdown",
                      choices = c("A", "B"),
                      selected = "A"),

          radioButtons(inputId = "radio_id",
                       label = "Label above buttons",
                       choices = c("test1", "test2", "test3"),
                       selected = "test2"),
        ),

        
        # Specify output the user sees on the right
        
        mainPanel(
          plotOutput("graphA"),
          textOutput("textA"),
          br(),
          plotOutput("graphB"),
          textOutput("textB")
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
      xlim(c(0, 15)) +
      stat_function(fun = dchisq, args = list(df = 5)) +
      labs(title = "Chi-square (5) Population") +
      theme_bw()
    a
    
  })

  
  # Use renderText to display text - make sure output$__ matches 
  # something in mainPanel in ui section
  
  output$textA <- renderText({
    
    ourtext <- paste("We can add text here that may contain numbers like", 4,
                     "in addition to our words.")
    ourtext
    
  })
  
  
  # Here we are adding a second graph
  
  output$graphB <- renderPlot({
    
    b <- ggplot(mtcars, aes(x = wt, y = mpg)) +
      geom_point()
    b
    
  })
  
  
  # And a second set of text 

  output$textB <- renderText({
    
    newtext <- paste("The current time is", 8, "o clock")
    newtext
    
  })
  
}




# This code runs the shiny app. You don't need to change this.

shinyApp(ui = ui, server = server)