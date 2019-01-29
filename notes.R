EIU = read.csv('EIU.csv')
head(EIU)

eiu = EIU[3:nrow(EIU), ]

LEIU = gather(eiu, index, score, EIU17VA:EIU96CC, factor_key = FALSE)
head(LEIU)
LEIU
colnames(LEIU)[1] = "Country"

LEIU$year = substr(LEIU$index,4,5)
LEIU$measure = substr(LEIU$index, 6,7)
head(LEIU)
write.csv(LEIU, 'leiu.csv')

colnames(eiu)[1] = "Country"
write.csv(eiu,'eiu.csv')
