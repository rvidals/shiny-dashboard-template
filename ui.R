ui <- dashboardPage(
  dashboardHeader(title = "Dashboard Example"),
  dashboardSidebar(),
  dashboardBody(
    tags$head(
      tags$style(HTML("
      .content-wrapper {
        background-color: white !important;
      }
    "))
    ),
    fluidRow(
      box(title = "Box 1", status = "primary", solidHeader = TRUE, "Content of Box 1"),
      box(title = "Box 2", status = "warning", solidHeader = TRUE, "Content of Box 2"),
      box(title = "Box 3", status = "success", solidHeader = TRUE, "Content of Box 3"),
      box(title = "Box 4", status = "danger", solidHeader = TRUE, "Content of Box 4")
    )
  )
)