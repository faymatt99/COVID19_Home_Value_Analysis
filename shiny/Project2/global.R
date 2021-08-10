library(shiny)
library(shinydashboard)
library(DT)
library(tidyverse)
library(lubridate)
library(ggthemes)
library(googleVis)
library(wesanderson)
library(RColorBrewer)
library(rex)
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)
library(plotly)
library(MASS)

df = read_csv('./data/proj_data.csv')

keep_columns = c('state', 'county', 'population', 'area', 'pop_dens', 'low_dif', 'mid_dif', 'high_dif', 'auc_parks', 'auc_work', 'auc_gro_pharm', 'auc_res', 'auc_transit', 'auc_driving', 'auc_walking', 'auc_public', 'auc_parks_weighted', 'auc_work_weighted', 'auc_gro_pharm_weighted', 'auc_res_weighted', 'auc_transit_weighted', 'auc_driving_weighted', 'auc_walking_weighted', 'auc_public_weighted')

df2 = df[, names(df) %in% keep_columns]
df2 = unique(df2)



# og_bonapp_df <- read.csv("data/full_bonapp_df.csv", stringsAsFactors = FALSE, row.names = 1)
# 
# og_bonapp_df$published <- ymd(og_bonapp_df$published)
# ingred_badata_df$published <- ymd(ingred_badata_df$published)
# 
# df_2020_totals <- og_bonapp_df %>% filter(year(published) == 2020) %>% 
#   group_by(published) %>% tally()
# 
# year_recipe_totals <- og_bonapp_df %>% group_by(year = year(published)) %>% tally() %>% head(6)
# 
# top_rated_dish <- og_bonapp_df %>% arrange(desc(ratings_count)) %>% head(3)
# 
# top_reviewed_dish <- og_bonapp_df %>% arrange(desc(review_count)) %>% head(3)