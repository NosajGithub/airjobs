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

Skills_level <- 
  Skills %>%
  filter(Scale.Name == 'Level') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()
Skills_level$dim <- 'Level'

Knowledge_importance <- 
Knowledge %>%
  filter(Scale.Name == 'Importance') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()

Knowledge_level <- 
  Knowledge %>%
  filter(Scale.Name == 'Level') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()

Interests_OI <- 
  Interests %>%
  filter(Scale.ID == 'OI') %>%
  select(O.NET.SOC.Code, Title, Element.Name, Data.Value) %>%
  spread(Element.Name, Data.Value)  %>%
  data.frame()

#### Output #### 
write.csv(Skills_importance, file = 'skills_importance.csv')
write.csv(Skills_level, file = 'skills_level.csv')
write.csv(Knowledge_importance, file = 'knowledge_importance.csv')
write.csv(Knowledge_level, file = 'knowledge_level.csv')
write.csv(Interests_OI, file = 'interests_OI.csv')
