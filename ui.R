library(shiny)
library(leaflet)
library(shinycssloaders)
library(rclipboard)

# add cookies

fluidPage(
  
  sidebarPanel(
  
  fileInput("dta", "Lade ein csv-file hoch", 
            accept = c(".csv")),
  tags$br(),
  tags$h5("Bitte lade ein UTF-8-csv-File."),
  
  tags$ol(
    tags$li("Variablen für Strasse  = Street"),
    tags$li("Variablen für Stadt    = Stadt"),
    tags$li("Variablen für Land     = Country"),
  ),
  tags$h5("Hier ein Beispiel:"),
  tags$img(src = 'bsp.jpg')
  
  ),
  
  mainPanel(
  rclipboardSetup(),
  
  shinycssloaders::withSpinner(color = "#15C1B0",
  tableOutput("table")
  )
  ,
  uiOutput("download")
  )
)