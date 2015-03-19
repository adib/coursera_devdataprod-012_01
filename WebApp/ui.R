
library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Estimate Fuel Efficiency"),
    fluidRow(
        column(width=12,
               p("This page will estimate a car's fuel efficiency with ",textOutput("predAccuracy",inline=TRUE)," expected accuracy given the car's specifications."),
               p("Enter the car's engine parameter in the space below and get an estimate of its fuel efficiency at the bottom of this page.")
               )
    ),
    fluidRow(
        column(width=4,
               selectInput("cyl", label = p("Number of Cylinders"), 
                           choices = list("4" = 4, "6" = 6,
                                          "8" = 8), selected = 6),
               numericInput("disp", label = p("Displacement (cu.in.)"), 
                            value = 160,min=0,step=10),
               numericInput("hp", label = p("Gross horsepower"), 
                            value = 110,min=0,step=10),
               numericInput("drat", label = p("Rear axle ratio"), 
                            value = 3.90,min=0,step=0.2),
               numericInput("wt", label = p("Weight (lb/1000)"), 
                            value = 2.620,min=0,step=0.1),
               numericInput("qsec", label = p("1/4 mile time in seconds"), 
                            value = 16.46,min=0,step=1),
               selectInput("vs", label = p("Engine Type"), 
                           choices = list("V" = "V", "Straight" = "S"), 
                           selected = "V"),
               selectInput("am", label = p("Transmission Type"), 
                           choices = list("Automatic" = "A", "Manual" = "M"), 
                           selected = "M"),
               selectInput("gear", label = p("Number of Forward Gears"), 
                           choices = list("3" = 3, "4" = 4,"5" = 5), 
                           selected = 4),
               selectInput("carb", label = p("Number of carburetors"), 
                           choices = list("1" = 1, "2" = 2,"3" = 3,"4" = 4,"6" = 6, "8" = 8), 
                           selected = 4)
        )
    ),
    fluidRow(
        column(width=12,
               p("Based on the above parameters, the car's fuel efficiency should be around ",strong(textOutput("predMPG",inline=TRUE)), " miles per gallon."),
               p("Reference data obtained from 1974 ",em("Motor Trend")," US magazine.")
               
        )
    )
))
