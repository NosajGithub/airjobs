#### Put together geo_salary csv file
Skills <- read.csv("~/git_root/BayesHack2016/reshaped_data/skills_importance.csv")

library(dplyr)
library(Rbnb)

Skills

OESM <- read.csv("~/git_root/BayesHack2016/oesm15all/all_data_M_2015_cleaned.csv")
summary(OESM)
OESM$X <- c()

OESM$a_median <- as.numeric(OESM$a_median)

OESM_reshaped <- OESM %>%
  filter(area_type==2
         , ! group %in% c("total","major")) %>% 
  mutate(state = gsub(" ", "_",tolower(area_title))) %>% 
  group_by(state) %>% 
  mutate(jobrankscore = rank(ifelse(is.na(jobs_1000), 0, jobs_1000))/n()) %>% 
  select(occ.code
         , occ.title
         , state
         , jobrankscore
#         , jobsquo = loc_quotient
         , salary = a_median
  ) %>% 
  gather("attribute","value", 4:5) %>%
  unite(attribute_state, attribute, state) %>% 
  spread(attribute_state, value)

names(OESM_reshaped)[1:2] <- c("occ_code","occ_title")

missing_fun <- function(x){return(ifelse(is.na(x),0,x))}
OESM_reshaped[,3:53] <- OESM_reshaped[,3:53] %>% 
  mutate_each(funs(missing_fun))

summary(OESM_reshaped)

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
  select(occ_code = occ.code, salary_us = a_median) 

OESM_reshaped %<>% 
  inner_join(salary_national, by = "occ_code")

Skills %<>%
  mutate(occ.code = substr(O.NET.SOC.Code,1,7))

OESM_reshaped %>% 
  filter(occ.code %in% setdiff(OESM_reshaped$occ.code, Skills$occ.code)) %>% 
  select(occ.title) %>% as.data.frame()

write.csv(OESM_reshaped,file = "geo_salary.csv", row.names = FALSE)

#### Find the cutoff for job1k of geo filter
OESM_long <- OESM %>%
  filter(area_type==2
         , ! group %in% c("total","major")) %>% 
  mutate(state = gsub(" ", "_",area_title)) %>% 
  select(occ.code
         , occ.title
         , state
         , jobs1k = jobs_1000
         , jobsquo = loc_quotient
         , salary = a_median
  )

OESM_long %>% 
  group_by(occ.code
           , occ.title) %>% 
  summarise(min(jobs1k, na.rm= TRUE)
            , quantile(jobs1k, 0.1, na.rm= TRUE)
            , quantile(jobs1k, 0.25, na.rm= TRUE)
            , quantile(jobs1k, 0.5, na.rm= TRUE)
            , quantile(jobs1k, 0.75, na.rm= TRUE)
            , quantile(jobs1k, 0.9, na.rm= TRUE)
            , max_jobs1k = max(jobs1k, na.rm= TRUE)) %>% 
  ggplot() +
  geom_histogram(aes(x=max_jobs1k)
                 , binwidth = 0.1)+
  scale_x_continuous(limit = c(0,5))

OESM_long %>% 
  group_by(state) %>% 
  summarise(min(jobs1k, na.rm= TRUE)
            , quantile(jobs1k, 0.1, na.rm= TRUE)
            , quantile(jobs1k, 0.25, na.rm= TRUE)
            , quantile(jobs1k, 0.5, na.rm= TRUE)
            , quantile(jobs1k, 0.75, na.rm= TRUE)
            , quantile(jobs1k, 0.9, na.rm= TRUE)
            , max_jobs1k = max(jobs1k, na.rm= TRUE)) %>% as.data.frame()
  ggplot() +
  geom_histogram(aes(x=max_jobs1k))+
  scale_x_continuous(limit = c(0,5))
  
OESM_long %>% 
  group_by(state) %>% 
  mutate(jobrankscore = rank(ifelse(is.na(jobs1k), 0, jobs1k))/n()) %>% 
  filter(state == "California") %>% 
  select(occ.title, jobsquo, jobrankscore,jobs1k) %>% 
  arrange(jobrankscore) %>% head(25) %>% as.data.frame()
  
