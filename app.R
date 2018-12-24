#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
source('Header.R')
source('Body.R')
source('Slide.R')


# Define UI for application that draws a histogram


ui <- shinyUI(
    dashboardPage(skin = "purple", header, slide ,body)
)

# Define server logic required to draw a histogram
#' Title
#'
#' @param input 
#' @param output 
#' @param session 
#'
#' @return
#' @export
#'
#' @examples
#' 
server <- function(input, output, session) {
    
    mycsv <- reactive({
        req(input$file_input)
        fil_Path_Lis <- list(input$file_input[['datapath']])
        fil_Name_Lis <- strsplit(input$file_input$name," ")
        mylist <- list()
        for (i in 1:length(input$file_input$datapath)) {
            key <-  as.character(fil_Name_Lis[[i]])
            mylist[key] <- fil_Path_Lis[[1]][i]
        }
        observe({
            updateSelectInput(session, "file_select", choices = fil_Name_Lis)
        })
        data_set <-  read.csv(file=mylist[[1]][1],header = T)
        return(mylist)
    })
    
    output$textoutput <- renderDataTable({
        mycsv()
        req(input$file_select)
        req(input$file_input)
        
            data_set <-  read.csv(file=mycsv()[[input$file_select]],header = T)
            data_set
        #read.csv(file = input$file_input[['datapath']],header = T)
                
        
    })
    
    output$hist <- renderPlotly(
        ggplotly(ggplot(data= faithful, aes(faithful$eruptions))+geom_histogram(bins = input$bin,
            col="red",
            fill="green")+labs(x="Eruptions")))
        
    output$data <- renderTable({
        df <- as.data.frame(t(head(faithful[1],10)))
        names(df) <- NULL
        df
    })
    }

# Run the application
shinyApp(ui = ui, server = server)

## ---------------------------------------------

# output$a <- renderUI({
#     if (input$sbId=="two") {
#         shinyalert("Oops!", "Something went wrong.", type = "input")
#     }
# })
# msg <- apply(read.csv("messages.csv"), 1 ,function(row){
#     messageItem(from = row[["from"]],message = row[["message"]])
# })
# output$msgOut <- renderMenu(
#     dropdownMenu(type = "message", .list = msg)
#     )