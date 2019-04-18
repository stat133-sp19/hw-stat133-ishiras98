#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram

future_value = function(amount, rate, years) {
  future_val = amount*((1+rate)^years)
  return(future_val)
}

annuity = function(contrib, rate, years) {
  annuity_calc = contrib*((((1+rate)^years)-1)/rate)
  return(annuity_calc)
}

growing_annuity = function(contrib, rate, growth, years) {
  growing_calc = contrib*((((1+rate)^years)-((1+growth)^years))/(rate-growth))
  return(growing_calc)
}

ui <- fluidPage(
  
  #name of app
  titlePanel("Simulation of Savings-Investment Scenarios"),
  
  #widgets 
  fluidRow(
    column(4,
           
           # Slider bar 1 
           sliderInput("amount", label = h3("Initial Amount"), min = 0, 
                       max = 100000, step = 500, pre = "$", value = 1000)
    ),
    column(4,
           
           # Slider bar 2
           sliderInput("return", label = h3("Return Rate (in %)"), min = 0, 
                       max = 20, step = 0.1, value = 5)
    ),
    column(4,
           
           # Slider bar 3 
           sliderInput("years", label = h3("Years"), min = 0, 
                       max = 50, step = 1, value = 20)
    )
  ),
  
  #New row
  
  fluidRow(
    column(4,
           
           # Slider bar 1
           sliderInput("contrib", label = h3("Annual Contribution"), min = 0, 
                       max = 50000, step = 500, pre = "$", value = 2000)
    ),
    column(4,
           
           # Slider bar 2 
           sliderInput("growth", label = h3("Growth Rate (in %)"), min = 0, 
                       max = 20, step = 0.1,  value = 2)
    ),
    column(4,
           
           # Select input 3 
           
           selectInput("facet", label = h3("Facet"), 
                       choices = list("Yes" = 0, "No" = 1), 
                       selected = 1)
    )
  ),
  
  hr(),
  
    
  fluidRow(h4("Timelines"),
           plotOutput("lineplot")),
  
  br(),
  
  fluidRow(h4("Balances"),
           verbatimTextOutput("dataframe")
            
  )
)

# Define server logic required to draw line plot and data frame
server <- function(input, output) {
  
  output$lineplot <- renderPlot({
  library(ggplot2)
    
  years = input$years
  no_contrib = c(rep(0, years+1))
  fixed_contrib = c(rep(0, years+1))
  growing_contrib = c(rep(0, years+1))
  
  amount = input$amount
  contrib = input$contrib
  rate = input$return/100
  growth = input$growth/100
  for (i in 0:years) {
    no_contrib[i+1] = future_value(amount, rate, i)
    fixed_contrib[i+1] = annuity(contrib, rate, i) + future_value(amount, rate, i)
    growing_contrib[i+1] = growing_annuity(contrib, rate, growth, i) + future_value(amount, rate, i)
  }
  
  
  modalities = data.frame(year = rep(c(0:years), 3), modes = c(no_contrib, fixed_contrib, growing_contrib),
                          variable = c(rep('no contrib', years + 1), rep('fixed contrib', years + 1), rep('growing contrib', years + 1)))
  
  if(input$facet == 1) {
  
  ggplot(data = modalities, aes(x = year, y = modes, group = variable)) +
    geom_line(aes(color = variable), size = 0.8) +
    geom_point(aes(color = variable), size = 1) +
    labs(x = 'year', y = 'value', title = 'Three modes of investing')
  
  } else {
    ggplot(data = modalities, aes(x = year)) + 
      geom_point(aes(y = modes, colour = variable)) +
      geom_line(aes(y = modes, colour = variable))  +
      geom_area(aes(y = modes, fill = variable), alpha = 0.5) + 
      labs(x = 'year', y = 'value', title = 'Three modes of investing') + 
      facet_wrap(~variable) + theme_bw()
      
  }
})
 
  output$dataframe <- renderPrint({
    
    years = input$years
    no_contrib = c(rep(0, years+1))
    fixed_contrib = c(rep(0, years+1))
    growing_contrib = c(rep(0, years+1))
    
    amount = input$amount
    contrib = input$contrib
    rate = input$return/100
    growth = input$growth/100
    for (i in 0:years) {
      no_contrib[i+1] = future_value(amount, rate, i)
      fixed_contrib[i+1] = annuity(contrib, rate, i) + future_value(amount, rate, i)
      growing_contrib[i+1] = growing_annuity(contrib, rate, growth, i) + future_value(amount, rate, i)
    }
    modalities = data.frame(year = c(0:years), no_contrib = no_contrib, fixed_contrib = fixed_contrib, growing_contrib = growing_contrib)
    modalities 

  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

