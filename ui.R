#
#This is the ui file for the Week4shinyAPP for Week 4 Course project of Developing Data Products
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("US Arrests Data by State, 1973"),

  # Sidebar with a Selection for region and then state
  sidebarLayout(
    sidebarPanel(
      selectInput("region", "Choose a Region:",
                  unique(state.region)),
      uiOutput("SelectState"),
      p("How to use this App:"),
      p("This app uses data from the USArrests data set in R to provide a visualization of
        Arrest records by state for the crimes of Murder, Assault and Rape in 1973.
        The user selects the state for which he would like to see Arrest data 
        by first selecting a Region and then a State (upon selecting a region,
        the States in that Region will populate under the choice of State).
        The bar heights reflect the Arrest rates per 100,000 people. The table in the upper
        left hand corner displays indices indicating
        the arrest rate of that state relative to the average of all states in the nation and the
        selected region.
        (1 means the Arrest Rate equals the average). 
        The color of the bars reflects the region selected.")
         ), 
   
    # Show the crimes in that state
    mainPanel(
       h3(textOutput("regionname")),
       h3(textOutput("statename")),
       plotOutput("crimeplot"),
       p("Source: World Almanac and Book of facts 1975 as presented in USArrests data in R base package")
    
       
    ))
  )
)
