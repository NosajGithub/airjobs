Skills <- read.csv("~/git_root/BayesHack2016/reshaped_data/skills_importance.csv")

library(dplyr)
library(Rbnb)

Skills

OESM <- read.csv("~/git_root/BayesHack2016/oesm15all/all_data_M_2015_cleaned.csv")
summary(OESM)
OESM$X <- c()

OESM$a_median <- as.numeric(OESM$a_median)

OESM_reshaped <- OESM %>%
  filter(area_type==2) %>% 
  mutate(state = gsub(" ", "_",area_title)) %>% 
  select(occ.code
         , occ.title
         , state
         , jobs1k = jobs_1000
         , jobsquo = loc_quotient
         , salary = a_median
  ) %>% 
  gather("attribute","value", 4:6) %>%
  unite(attribute_state, attribute, state) %>% 
  spread(attribute_state, value)

OESM %>% 
  filter(area_type==1
         , naics_title == "Cross-industry"
         ) %>%
  select(occ.code, a_median) %>% 
  ggplot() +
  geom_histogram(aes(x = a_median))

salary_national <- OESM %>% 
  filter(area_type==1
         , naics_title == "Cross-industry"
  ) %>%
  select(occ.code, salary_US = a_median) 

OESM_reshaped %<>% 
  inner_join(salary_national, by = "occ.code")

Skills %<>%
  mutate(occ.code = substr(O.NET.SOC.Code,1,7))

OESM_reshaped %>% 
  filter(occ.code %in% setdiff(OESM_reshaped$occ.code, Skills$occ.code)) %>% 
  select(occ.title) %>% as.data.frame()

write.csv(OESM_reshaped,file = "geo_salary.csv", row.names = FALSE)
