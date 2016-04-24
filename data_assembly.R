library(tidyr)
library(dplyr)
#### Data #### 
Skills <- read.csv("~/Desktop/BayesHack/Skills.csv")
Knowledge <- read.csv("~/Desktop/BayesHack/Knowledge.csv")
Interests <- read.csv("~/Desktop/BayesHack/Interests.csv")

####  Reshape the data #### 
Skills_importance <- 
  Skills %>%
  filter(Scale.Name == 'Importance') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
Skills_importance$dim <- 'Importance'
colnames(Skills_importance)[-c(1,2)] <- paste0('skills_',colnames(Skills_importance))[-c(1,2)]

Skills_level <- 
  Skills %>%
  filter(Scale.Name == 'Level') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
Skills_level$dim <- 'Level'
colnames(Skills_level)[-c(1,2)] <- paste0('skills_',colnames(Skills_level))[-c(1,2)]

Knowledge_importance <- 
Knowledge %>%
  filter(Scale.Name == 'Importance') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
colnames(Knowledge_importance)[-c(1,2)] <- paste0('knowledge_',colnames(Knowledge_importance))[-c(1,2)]

Knowledge_level <- 
  Knowledge %>%
  filter(Scale.Name == 'Level') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
colnames(Knowledge_level)[-c(1,2)] <- paste0('knowledge_',colnames(Knowledge_level))[-c(1,2)]

Interests_OI <- 
  Interests %>%
  filter(Scale.ID == 'OI') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
colnames(Interests_OI)[-c(1,2)] <- paste0('interests_',colnames(Interests_OI))[-c(1,2)]

interests_skills_knowledge<-
Interests_OI  %>% 
  left_join(Skills_level, by = c('O.NET.SOC.Code' = 'O.NET.SOC.Code', 'Title' = 'Title')) %>%
  left_join(Knowledge_importance, by = c('O.NET.SOC.Code' = 'O.NET.SOC.Code', 'Title' = 'Title'))  %>%
  mutate(O.NET.SOC.Code_short = substr(as.character(O.NET.SOC.Code), 1, 7)) 



#### Output #### 
write.csv(Skills_importance, file = 'skills_importance.csv')
write.csv(Skills_level, file = 'skills_level.csv')
write.csv(Knowledge_importance, file = 'knowledge_importance.csv')
write.csv(Knowledge_level, file = 'knowledge_level.csv')
write.csv(Interests_OI, file = 'interests_OI.csv')
