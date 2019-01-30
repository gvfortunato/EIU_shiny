server = shinyServer(function(input,output) {
  
  output$index = renderText({
    input$selected
  })
  
  output$map = renderGvis({
    gvisGeoChart(data = data, locationvar = 'Country', colorvar = 
                 paste0('EIU',substr(input$yselected,3,4),
                        case_when(input$selected == 'Voice and Accountability' ~ 'VA',
                                  input$selected == 'Political Stability and Absence of Violence' ~ 'PV',
                                  input$selected == 'Government Effectiveness' ~ 'GE',
                                  input$selected == 'Regulatory Quality' ~ 'RQ', 
                                  input$selected == 'Rule of Law' ~ 'RL',
                                  input$selected == 'Control of Corruption' ~ 'CC')), 
                 options = list(width = '600', height = 'auto'))
  })
  
  output$chart = renderGvis(gvisLineChart(
    ldata %>% select('Country','year','measure','score') %>% 
      filter(Country == input$cselected & 
               measure == case_when(input$iselected == 'Voice and Accountability' ~ 'VA',
                                    input$iselected == 'Political Stability and Absence of Violence' ~ 'PV',
                                    input$iselected == 'Government Effectiveness' ~ 'GE',
                                    input$iselected == 'Regulatory Quality' ~ 'RQ', 
                                    input$iselected == 'Rule of Law' ~ 'RL',
                                    input$iselected == 'Control of Corruption' ~ 'CC')),  
            xvar  = 'year', yvar = 'score', 
            options = list(width = '600', height = 'auto',
                           title = paste(input$iselected, 'in', input$cselected))))
  

  })