#
# This is the server file for the Week4shinyAPP for Week 4 Course project of Developing Data Products
#

library(shiny)

shinyServer(function(input, output) {

  output$SelectState <- renderUI({
    selectInput("choosestate", "Choose States", state.name[state.region==input$region])
  })
  
  output$regionname <- renderText(input$region)
  
  output$statename <- reactive(input$choosestate)
  
  output$crimeplot <- renderPlot({
    
    #Set up the data for plotting:
    df<- USArrests[input$choosestate,]
    barheights <- c(df$Murder, df$Rape, df$Assault)
    plotmatrix <- matrix(nrow=1, ncol=3, data=barheights)
    colnames(plotmatrix) <- c("Murder", "Rape", "Assault")
    
    ## Calculate the Indices for the Table:
    nationalAVG <- c(mean(USArrests$Murder),mean(USArrests$Rape),mean(USArrests$Assault))
    instates<-state.region==input$region
    murderregion<-mean(USArrests$Murder[instates])
    raperegion <- mean(USArrests$Rape[instates])
    assaultregion <- mean(USArrests$Assault[instates])
    regionAVG<-c(murderregion, raperegion, assaultregion)
    VSnationalAVG <- round(barheights/nationalAVG, digits=2)
    VSregionAVG <- round(barheights/regionAVG, digits=2)
    
    # Set up the formatting for the plot:
    regioncolor<-"gray"
    if(input$region=="South"){regioncolor<-"purple"}
    if(input$region=="West"){regioncolor<-"coral"}
    if(input$region=="Northeast"){regioncolor<-"light blue"}
    if(input$region=="North Central"){regioncolor<-"hotpink"}
    
    # Make the plot:
    x<-barplot(plotmatrix, 
            ylim=c(0,375), 
            col=regioncolor,
            main="Arrest rate and Comparison to Average State",
            ylab="Arrest Rate per 100,000 people")
    y<- c(df$Murder, df$Rape, df$Assault)
    x
    legend('topleft', ncol = 3L, title = 'Compared to Average State', bg="wheat",
           legend = c("Crime", "Murder" , "Rape", "Assault", "Nation",
                      VSnationalAVG, "Region", VSregionAVG))
  }) # Close renderPlot
  
})   # Close shinyServer




