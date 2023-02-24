library(shiny)
library(tidyverse)
library(tidygeocoder)


function(input, output) {
  
  
  dta <- reactive({
    req(input$dta)
    
    
    data <- read_csv2(input$dta$datapath)
    
    
    })
  
  
  processed_data <- reactive({
    
    dta() %>% 
      as.tibble() %>% 
      geocode(street = Street, city = City, country = Country, method = "osm") %>% 
      as.data.frame() %>% 
      select(lat, long, Street, City, Country)
    
    
  })
  
  
  output$table <- renderTable({
    
    processed_data() %>% 
      head(10)
    
  })
  
  

output$Download <- downloadHandler(
  filename = function(){
    paste0("address_to_coord_", input$dta$name)
  },
  content = function(file){

    write_csv2(processed_data(), file)
  }
)


output$download <- renderUI({
  if(!is.null(processed_data())) {
    downloadButton('Download', 'Download coord-File')
  }
})

}