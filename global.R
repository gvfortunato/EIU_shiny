library(shiny)
library(shinydashboard)
library(googleVis)
library(dplyr)
data = read.csv('eiu.csv')
data = data[,-1]

chooseIndex = c('Voice and Accountability','Political Stability and Absence of Violence',
                'Government Effectiveness','Regulatory Quality', 'Rule of Law',
                'Control of Corruption')
chooseYear = seq(1996,2017)
