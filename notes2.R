library(dplyr)


neiu = read.csv('eiu.csv', stringsAsFactors = FALSE)
neiu = neiu[3:nrow(neiu), ]
colnames(neiu)[1] = "Country"
View(neiu[,3:ncol(neiu)])

neiu[,3:ncol(neiu)] = lapply(neiu[,3:ncol(neiu)], function(x) as.numeric(x))



cor(neiu[ ,'EIU17VA':'EIU17CC'])

cor(neiu[ ,3:8], use = 'complete.obs')

demcorr = neiu %>% select('EIU17VA':'EIU17CC') %>% cor(., use = 'complete.obs')
library(corrplot)
corrplot(demcorr)


leiu = read.csv('./EIU_shiny/leiu.csv')
View(leiu)

leiu = leiu[,-1]

Yleiu = leiu %>% mutate(year = case_when(leiu$year > 90 ~ paste0('19',leiu$year),
                                     leiu$year < 10 ~ paste0('200',leiu$year),
                                     leiu$year >= 10 ~ paste0('20', leiu$year))
)
View(Yleiu)

Yleiu %>% select('Country','year','measure','score') %>% 
  filter(Country == 'Australia' & measure == 'VA') %>%
  ggplot(aes(x = year, y = score, group = 1, na.rm = T)) + geom_line()

write.csv(Yleiu, 'yleiu.csv')
     