ui = fluidPage(shinyUI(
  dashboardPage(
    dashboardHeader(title = "Economist Intelligence Unit Democracy Indices", titleWidth = 500),
    dashboardSidebar(
      
        sidebarMenu(
          menuItem('Map', tabName = 'map'),
          menuItem('Chart', tabName = 'chart')
         
        )
      ),
      dashboardBody(tabItems(
        tabItem(tabName = 'map',
           fluidRow(box(verbatimTextOutput('index'))),
           fluidRow(box(htmlOutput("map")),
           
           selectInput('selected','Select Index to Display', chooseIndex),
           selectInput('yselected','Select Year to Display', chooseYear)
        )),
        tabItem(tabName = 'chart',
           fluidRow(box(htmlOutput("chart"))),
           selectInput('iselected','Select Index to Display', chooseIndex),
           selectInput('cselected','Select Country to Display', chooseCountry)
                
                )
      ))
    )
  )
)