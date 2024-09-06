# Load necessary libraries
library(shiny)
library(shinydashboard)
library(mypack)  # Load your custom package

# Define the UI
ui <- dashboardPage(
  dashboardHeader(title = "MyPack Shiny Dashboard"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Power 4", tabName = "power4", icon = icon("calculator")),
      menuItem("Square", tabName = "square", icon = icon("calculator")),
      menuItem("Power 5", tabName = "power5", icon = icon("calculator"))
    )
  ),

  dashboardBody(
    tabItems(
      # Tab for hello2 (x^4)
      tabItem(tabName = "power4",
              fluidRow(
                box(
                  title = "Input", status = "primary", solidHeader = TRUE,
                  numericInput("num1", "Input a number:", 2),
                  actionButton("submit1", "Submit")
                ),
                box(
                  title = "Output", status = "info", solidHeader = TRUE,
                  textOutput("result1")
                )
              )
      ),

      # Tab for hello3 (x^2)
      tabItem(tabName = "square",
              fluidRow(
                box(
                  title = "Input", status = "primary", solidHeader = TRUE,
                  numericInput("num2", "Input a number:", 2),
                  actionButton("submit2", "Submit")
                ),
                box(
                  title = "Output", status = "info", solidHeader = TRUE,
                  textOutput("result2")
                )
              )
      ),

      # Tab for hello4 (x^5)
      tabItem(tabName = "power5",
              fluidRow(
                box(
                  title = "Input", status = "primary", solidHeader = TRUE,
                  numericInput("num3", "Input a number:", 2),
                  actionButton("submit3", "Submit")
                ),
                box(
                  title = "Output", status = "info", solidHeader = TRUE,
                  textOutput("result3")
                )
              )
      )
    )
  )
)

# Define the server logic
server <- function(input, output) {

  # For hello2 (x^4)
  observeEvent(input$submit1, {
    result1 <- hello2(input$num1)
    output$result1 <- renderText({
      paste("The result of", input$num1, "^ 4 is:", result1)
    })
  })

  # For hello3 (x^2)
  observeEvent(input$submit2, {
    result2 <- hello3(input$num2)
    output$result2 <- renderText({
      paste("The result of", input$num2, "^ 2 is:", result2)
    })
  })

  # For hello4 (x^5)
  observeEvent(input$submit3, {
    result3 <- hello4(input$num3)
    output$result3 <- renderText({
      paste("The result of", input$num3, "^ 5 is:", result3)
    })
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
