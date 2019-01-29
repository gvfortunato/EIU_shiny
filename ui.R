ui = fluidPage(shinyUI(
  dashboardPage(
    dashboardHeader(title = "Democracy Indices"),
    dashboardSidebar(
      
        sidebarMenu(
          selectInput('selected','Select Index to Display', chooseIndex),
          selectInput('yselected','Select Year to Display', chooseYear)
        )
      ),
      dashboardBody(
        fluidRow(box(htmlOutput("map"))
      )
      
      )
    )
  )
)