
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Estimate Fuel Efficiency"),
    fluidRow(
        column(width=12,
               p("This page will estimate a car's fuel efficiency with ",textOutput("predAccuracy",inline=TRUE)," expected accuracy given the car's specifications.")
               )
    ),
    fluidRow(
        column(width=4,
               selectInput("cyl", label = p("Number of Cylinders"), 
                           choices = list("4" = 4, "6" = 6,
                                          "8" = 8), selected = 6),
               numericInput("disp", label = p("Displacement (cu.in.)"), 
                            value = 160),
               numericInput("hp", label = p("Gross horsepower"), 
                            value = 110),
               numericInput("drat", label = p("Rear axle ratio"), 
                            value = 3.90),
               numericInput("wt", label = p("Weight (lb/1000)"), 
                            value = 2.620),
               numericInput("qsec", label = p("1/4 mile time"), 
                            value = 16.46),
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
               p("Based on the above parameters, the engine's fuel efficiency should be around ",strong(textOutput("predMPG",inline=TRUE)), " miles per gallon.")
        )
    )
))
