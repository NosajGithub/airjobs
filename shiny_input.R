##############################################################
####             Kelsey Jiang 04/24/2016                  #### 
##############################################################
library(tidyr)
library(dplyr)
#### Shiny User Interface Input Function ####
database <- read.csv("~/airjobs/reshaped_data/database.csv")

df<- data.frame(skill_col_1 = c(1,2,3))
df$skill_col_1  <- c(1,2,3)
df$skill_col_2 <- c(1,2,3)
df$skill_col_3 <- c(1,2,3)
df$skill_col_4 <- c(1,2,3)
df$skill_col_5 <- c(1,2,3)
df$skill_weight_1 <- c(1,2,3)
df$skill_weight_2 <- c(1,2,3)
df$skill_weight_3 <- c(1,2,3)
df$skill_weight_4 <- c(1,2,3)
df$skill_weight_5 <- c(1,2,3)
df$interest_1 <- c(1,2,3)
df$interest_2 <- c(1,2,3)
df$interest_df <- c(1,2,3)
df$interest_weight_1 <- c(1,2,3)
df$interest_weight_2 <- c(1,2,3)
df$interest_weight_3 <- c(1,2,3)
df$knowledge_1 <- c(1,2,3)
df$knowledge_2 <- c(1,2,3)
df$knowledge_3 <- c(1,2,3)
df$knowledge_4 <- c(1,2,3)
df$knowledge_5 <- c(1,2,3)
df$knowledge_weight_1 <- c(1,2,3)
df$knowledge_weight_2 <- c(1,2,3)
df$knowledge_weight_3 <- c(1,2,3)
df$knowledge_weight_4 <- c(1,2,3)
df$knowledge_weight_5 <- c(1,2,3)
df$state_1 <- c(1,2,3)
df$state_2 <- c(1,2,3)
df$state_3 <- c(1,2,3)
df$salary_california <- c(1,2,3)
df$salary_new_york <- c(1,2,3)
df$salary_west_virginia <- c(1,2,3)
df$education_level_required <- c(1,2,3)
df$score <- c(100, 50, 5)

state_1 <- 'california'
state_2 <- 'new_york'
state_3 <- as.character(NA)
filter_job <- function (df, state_1, state_2, state_3) {
  df %>% 
    select(matches('salary_')) %>%
    select(matches(state_1))
  
  df[,paste0('salary_', state_1) ]  
}
paste0('salary_', state_1)

paste('salary_', state_1)
df %>% 
  select(matches('salary_'))

database %>% 
  select(matches('salary_')) %>%
  mutate_each(funs(mysum = ifelse(is.na(.), salary_us, .)), -salary_us) %>% 
  data.frame()

  
)
get_jobs <- function(
  
  ,  skill_col_1 
  ,  skill_col_2
  ,  skill_col_3
  ,  skill_col_4
  ,  skill_col_5
  
  , skill_weight_1
  , skill_weight_2
  , skill_weight_3
  , skill_weight_4
  , skill_weight_5
  
  ,  interest_1
  ,  interest_2
  ,  interest_3
  
  , interest_weight_1
  , interest_weight_2
  , interest_weight_3
  
  ,  knowledge_1
  ,  knowledge_2
  ,  knowledge_3
  ,  knowledge_4
  ,  knowledge_5
  
  ,  knowledge_weight_1
  ,  knowledge_weight_2
  ,  knowledge_weight_3
  ,  knowledge_weight_4
  ,  knowledge_weight_5
  
  ,  state_1
  ,  state_2
  ,  state_3
  
  , education_level
  
  , max_wage
  , min_wage
){
  
  # returns final df
}

filter_job <- 

  output_df <- dataframe(database_df[,c(skills_col_index
                                        ,interest_col_index
                                        ,knowledge_col_index
                                        ,geo_col_index
                                        ,"education_level_required"
                                        ,salary_col_index
                                        ,"salary_us")]
                         ,score = score1+score2)

