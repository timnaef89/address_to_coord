#connect with shiny.server

#install.packages('rsconnect')


#Authorize laptop to create connetciton

rsconnect::setAccountInfo(name='chmedia',
                          token='44F9D9EF8DFC36F7A28B33DF6B33F46E',
                          secret='OLY7hSSzM5uACWGf5zaI+/eYbiPRueNdwzHiVpZv')


### test app on localhost

library(shiny)




### load it to shinyapp.io
library(rsconnect)
deployApp()
