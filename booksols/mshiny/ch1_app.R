library(shiny)
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table"),
  plotOutput("hist")
)

server <- function(input, output, session) {

  # dset <- reactive({get(input$dataset, "package:datasets")})
  output$summary <- renderPrint({
    summary(dset())
  })

  output$table <- renderTable({
    dset()
  })
  
  output$hist <- renderPlot({
    hist(rnorm(10000), main="Histogram of normal values")
  })
}


shinyApp(ui, server)
