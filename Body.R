body <- dashboardBody(
  tags$script(HTML("$('body').addClass('sidebar-mini');")),
  # tags$head(tags$style(HTML('
  #     .form-group, .selectize-control {
  #          margin-bottom: 0px;
  #          margin-top: 0px;
  #          padding-bottom: 0px;
  #          padding-top: 0px;
  #     }
  #     .box-body {
  #         padding-bottom: 0px;
  #         padding-top: 0px;
  #         margin-bottom: 0px;
  #          margin-top: 0px;
  #     }'))),
  tabItems(
    
    tabItem(tabName = "one",
            h1("Dash")
            ),
    
    tabItem(tabName = "two",
            fluidPage(
              # Application title
              titlePanel("Multiple File to input"),
              
              # Sidebar with a slider input for number of bins 
              sidebarLayout(
                sidebarPanel(width = 3,
                  fileInput("file_input",
                            "Upload File",
                            multiple = T,
                            placeholder = "here"),
                  selectInput("file_select",
                              "Selected Files",
                              "Files"),
                  
                  checkboxInput("chk_box_inp",
                                "Merge"),
                  selectInput("col_select",
                              "Select Column",
                              ""),
                  selectInput("grp_select",
                              "Select Group Type",
                              "")
                ),
                # Show a plot of the generated distribution
                mainPanel(
                  div(style='height:560px;width:800px; overflow-y: scroll',
                      dataTableOutput("textoutput")
                  )
                )
              )
            )),
    
    
    tabItem(tabName = "thr",
            h1("Audit")),
    
    
    tabItem(tabName = "four",
            fluidRow(
              box(title = "Plot", plotlyOutput("hist")),
              
              box(collapsible = T,
                  sliderInput("bin", "Slider input:", 1, 100, 10))
              )
            )
    )
  )


# tabItems(
#     tabItem(tabName = "one",
#             fluidRow(
#                 box(title = "control", status = "warning", plotlyOutput("hist"))),
#             box(title = "Slider", sliderInput("bin","Slider",1,100,50))),
#     tabItem(tabName = "two",
#             h1("Finance")))
# fileInput("file_input",
#           "Upload File",
#           multiple = T,
#           placeholder = "here"),
