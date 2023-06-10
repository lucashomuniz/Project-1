"
====================
ANALYTIC DASHBOARDS
====================
"

# Imports
library(shiny)
library(plotly)
library(shinythemes)

# Load the first clean dataset
dataset1 <- read.csv("datasets_limpos/dataset1.csv")

# Set the data type of some columns
dataset1$X..of.Subscribers.Q4.2021..Estimate. <- as.numeric(gsub(",", "", dataset1$X..of.Subscribers.Q4.2021..Estimate.))
dataset1$Q4.2021.Revenue....Estimate. <- as.numeric(gsub(",", "", dataset1$Q4.2021.Revenue....Estimate.))

# Create dataframes by filtering outliers
dataset1_scat_out <- filter(dataset1, Country != "United States")
dataset1_bar <- filter(dataset1, Country != "Switzerland")
dataset1_bar_out <- filter(dataset1_bar, Country != "South Africa")

# Load datasets 2, 3 and 6
genre <- read.csv("datasets_limpos/dataset2.csv")
tree <- read.csv("datasets_limpos/dataset3.csv")
countries <- read.csv("datasets_limpos/dataset6.csv")

# Filter the list of countries by removing NA values
country_list <- filter(countries, is.na(parents))

"
====================
UI - User Interface
====================
"

# https://rstudio.github.io/shinythemes/
# Note: Windows users should remove this part of the line below (including the comma): theme = shinytheme("cerulean"),
# Reason: Bug on Windows with shinythemes package. On other OSes it works normally.
ui <- navbarPage(theme = shinytheme("cerulean"), 
                 
                 "Project 1",

                 tabPanel("Overview",
                          sidebarLayout(
                            sidebarPanel(                              
                              selectInput("select", 
                                          label = h4("Select the Y Axis Variable:"), 
                                          choices = list("Netflix Q4-2021 Billing" = "Q4.2021.Revenue....Estimate.", 
                                                         "Netflix Subscriptions Q4-2021" = "X..of.Subscribers.Q4.2021..Estimate.",
                                                         "Total Catalog Size" = "Total.Library.Size", 
                                                         "Basic Subscription Price" = "Cost.Per.Month...Basic....", 
                                                         "Standard Subscription Price"= "Cost.Per.Month...Standard....",
                                                         "Premium Subscription Price" = "Cost.Per.Month...Premium...."), 
                                          selected = 1),
                              checkboxInput("outlierscatter", "Show Outlier", FALSE)),
                          mainPanel(
                            plotlyOutput("scatPlot")))
                 ),
                 tabPanel("Wage Inequality",
                          h4("Income Disparity and Pricing Differences for Netflix Basic, Standard and Premium Subscription (Monthly)"),
                          sidebarPanel(
                            checkboxInput("outlierbar", "Show Outlier", FALSE)),
                          mainPanel(
                            plotlyOutput("barPlot"))
                 ),
                 tabPanel("Popular Genres",
                            tabPanel("Country", 
                                     sidebarLayout(
                                       sidebarPanel(
                                         selectInput("Country", 
                                                     label = h3("Select Country:"), 
                                                     choices = country_list$labels, 
                                                     selected = 1),
                                       ),
                                       mainPanel(
                                         h3("Genre Popularity of Movies by Country"),
                                         h5("Based on the number of times a movie/TV show of a given genre has been on the
                                             Netflix Weekly Top 10 in a Country (Data June 2021-March 2022)."),
                                         plotlyOutput("countryPlot")
                                       )
                                     )
                                     ), 
                          ),
                 tabPanel("Netflix Subscribers",
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("select3", 
                                          label = h3("Select the Scale:"), 
                                          choices = list("Netflix Q4-2021 Billing" = "Q4.2021.Revenue....Estimate.", 
                                                         "Netflix Q4-2021 Subscriptions" = "X..of.Subscribers.Q4.2021..Estimate."),
                                          selected = 1),
                              checkboxInput("outliermap", "Show Outlier", FALSE),),
                            mainPanel(
                              plotlyOutput("mapPlot"),
                              h3("Billing x Subscriptions"),
                              plotlyOutput("mapscatPlot")),
                            
                          )
                 )
)


"
===============
SERVER`S LOGIC
===============
"

server <- function(input, output) {

  # Scatter Plot
  output$scatPlot <- renderPlotly({
    if (input$outlierscatter){
      dfs <- dataset1
    } else {
      dfs <- dataset1_scat_out
    }
    fig <- plot_ly(data = dfs, x = ~X2020.GDP..World.Bank., y = ~get(input$select), type = "scatter", mode = "markers", text = ~Country)
    fig <- fig %>% layout(yaxis = list(title = 'Selected Variable'), xaxis = list(title = 'GDP (USD)'))
    fig
    })

  # Bar Plot
  output$barPlot <- renderPlotly({
    if (input$outlierbar){
      dfb <- dataset1_bar
    } else {
      dfb <- dataset1_bar_out
    }
    fig <- plot_ly(dfb, x = ~gini_disp, y = ~Cost.Per.Month...Basic...., type = 'bar', name = 'Basic', text = ~Country)
    fig <- fig %>% add_trace(y = ~basic_standard_diff, name = 'Standard')
    fig <- fig %>% add_trace(y = ~standard_premium_diff, name = 'Premium')
    fig <- fig %>% layout(yaxis = list(title = 'Monthly Cost of Basic, Standard and Premium Plans (USD)', titlefont = list(size=10)), xaxis = list(title = 'Wage Inequality (GINI)'), barmode = 'stack')
    fig
  })
  
  # Country Plot
  output$countryPlot <- renderPlotly({
    country <- filter(countries, parents == input$Country)
    country <- rbind(filter(countries, labels == input$Country), country)
    fig <- plot_ly(country, ids = ~id, labels = ~labels, parents = ~parents, values = ~n, type = 'treemap', branchvalues = 'total', pathbar = list(visible = TRUE))
    
    fig
  })
  
  # Treemap Plot
  output$treePlot <- renderPlotly({
    fig <- plot_ly(tree, ids = ~id, labels = ~label, parents = ~parent, values = ~n, type = 'treemap', branchvalues = 'total', pathbar = list(visible = TRUE))
    
    fig
  })
  
  # Map
  output$mapPlot <- renderPlotly({
    if (input$outliermap){
      dfm <- dataset1
    } else {
      dfm <- dataset1_scat_out
    }
    
    l <- list(color = toRGB("grey"), width = 0.5)
    
    # https://en.wikipedia.org/wiki/List_of_map_projections
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'Miller')
    )
    
    fig <- plot_geo(dfm)
    fig <- fig %>% add_trace(z = ~get(input$select3), 
                             color = ~get(input$select3), 
                             colorscale = 'Purples', 
                             text = ~Country, 
                             locations = ~Alpha.3.code, 
                             marker = list(line = l))

    fig <- fig %>% colorbar(title = 'Scale')
    fig <- fig %>% layout(title = 'Netflix Global Map in Q4-2021')
    fig
  })

  # Scatter Plot
  output$mapscatPlot <- renderPlotly({
    if (input$outliermap){
      dfms <- dataset1
    } else {
      dfms <- dataset1_scat_out
    }
    fig <- plot_ly(data = dfms, x = ~X..of.Subscribers.Q4.2021..Estimate., y = ~Q4.2021.Revenue....Estimate., type = "scatter", mode = "markers", text = ~Country)
    fig <- fig %>% layout(yaxis = list(title = 'Netflix Revenue in Q4-2021'), xaxis = list(title = 'Netflix Subscribers in Q4-2021'))
    fig
  })
}

# Run the App
shinyApp(ui, server)
