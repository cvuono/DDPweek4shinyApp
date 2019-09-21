Shiny App pitch for USArrests Data Visualization App
========================================================
author: Charles Vuono
date: September 20, 2019
autosize: true

Descrption of the ShinyApp
========================================================

The Shiny Application explores data from the Base R data set USArrests. 

This data includes data on Arrest rates, by state, for the year 1973.

Key features are

- The App allows the user to select the state by first selecting the Region of that state
- THe App automatically changes the inputs for state according to the input selected
- Once the desired state is selected, the App graphs the arrest rates per 100,000 people for the crimes of Murder, Rape and Assault
- The App also computes an index for each crime measuiring the Arrest rate in the selected state to the average arrest rate of all states in the nations and separately all states in the selected region
- These indices appear clearly in a table on the graph
- For ease of use, the bar color changes according to the region selected

Sample Calculation
========================================================

Suppose the user selects "Northeast" for the region and "Connecticut" for the State. The calcuation would work as follows:


```r
    df<- USArrests["Connecticut",]
    barheights <- c(df$Murder, df$Rape, df$Assault)
    nationalAVG <- c(mean(USArrests$Murder),mean(USArrests$Rape),mean(USArrests$Assault))
    instates<-state.region=="Northeast"
    murderregion<-mean(USArrests$Murder[instates])
    raperegion <- mean(USArrests$Rape[instates])
    assaultregion <- mean(USArrests$Assault[instates])
    regionAVG<-c(murderregion, raperegion, assaultregion)
    VSnationalAVG <- round(barheights/nationalAVG, digits=2)
    VSregionAVG <- round(barheights/regionAVG, digits=2)
    VSnationalAVG
```

```
[1] 0.42 0.52 0.64
```

```r
    VSregionAVG
```

```
[1] 0.70 0.81 0.87
```

App Plot including Data Table
========================================================

The following is the sample output based on the region "Northeast" and state "Connecticut":


<img src="ShinyAPPpitch-figure/makeplot-1.png" title="plot of chunk makeplot" alt="plot of chunk makeplot" style="display: block; margin: auto;" />

Where to find the App
========================================================

The App is hosted on RStudio's shiny server at the following url:

https://cvuono.shinyapps.io/Week4shinyAPP/

The ui.R and server.R files are available on github at the following url:

https://github.com/cvuono/DDPweek4shinyApp
