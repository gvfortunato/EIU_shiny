server = shinyServer(function(input,output) {
  
  output$map = renderGvis({
    gvisGeoChart(data = data, locationvar = 'Country', colorvar = 
                 paste0('EIU',substr(input$yselected,3,4),
                        case_when(input$selected == 'Voice and Accountability' ~ 'VA',
                                  input$selected == 'Political Stability and Absence of Violence' ~ 'PV',
                                  input$selected == 'Government Effectiveness' ~ 'GE',
                                  input$selected == 'Regulatory Quality' ~ 'RQ', 
                                  input$selected == 'Rule of Law' ~ 'RL',
                                  input$selected == 'Control of Corruption' ~ 'CC')), 
                 options = list(width = '700', height = 'auto'))
  })
  
})