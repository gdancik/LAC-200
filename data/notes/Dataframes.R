#################################################################
# A data.frame is a table where columns can be different types. 
# Typically we access columns by name, e.g., df$age 
#################################################################

###################################################################
# You can read in files by using Import Dataset in the Environment 
# tab, and selecting options such as the delimiter. Clicking Import
# will read in the data and generate the code that will be in the
# History tab. To save time, the code for reading in our sample
# data is provided below.

library(readr)
survey <- read_delim("https://gdancik.github.io/CSC-315/data/datasets/survey.txt",
                      delim = "\t", escape_double = FALSE,
                      trim_ws = TRUE)


# Note: technically, the table returned will be stored as a
# 'tibble', which is a type of data frame with special properties
# that we will not discuss further, but for more
# information see: https://r4ds.had.co.nz/tibbles.html
##############################################################


# we can get the number of rows
nrow(survey)

# and the number of columns (variables)
ncol(survey)

colnames(survey) # get names of columns

# find the maximum College GPA
max(survey$`College GPA`)


###########################################################
# The dplyr package is useful for manipulating data frames
# Some useful functions are the following:
#   - filter(condition1, condition2, ...): filter out rows that do 
#         not match a condition
#   - select(column1, column2, ...): selects specified columns
#   - mutate(column = ...): adds/modifies a column 
#   - group_by(column1, column2, ...): groups by values of a 1 or more columns
#   - summarize (column = f(x), ...): summarizes data, by groups if group_by is used;
#                                     the summary is stored in the designated column
#   - arrange(x), arrange(desc(x)): sort the data by x in ascending
#          or descending order
#   - top_n(n): extract the top n rows
###########################################################

# Load the dplyr package 
library(dplyr)

##################################################################
# Typically, we use the 'pipe' ('%>%') operator to 
# manipulate data frames in a linear way
# x %>% f(y, ...) becomes f(x, y, ...)
# Note: the pipe operator comes from the 'magrittr' package, 
# which is loaded with 'dplyr'
##################################################################

# from the original survey we create a table containing HS and College
# GPA from females. The logic is as follows:

#           filter                                select
# survey ------------> (survey of only females) -----------> (keep only GPA columns)

# Create table for females, showing only GPAs
females <- survey %>% filter(Gender == "Female") %>%
                      select(`HS GPA`, `College GPA`)
print(females)

# another example:compare average (mean) GPAs between male and females
average_gpas <- survey %>% group_by(Gender) %>% 
                           summarize(mean_hs_gpa = mean(`HS GPA`),
                                     mean_college_gpa = mean(`College GPA`))
average_gpas


###########################
## Exercises
###########################

# We will analyze IMDB data from: https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows

imdb <- read_csv('https://gdancik.github.io/LAC-200/data/notes/imdb_top_1000.csv')

################################################################
# get the Series_Title, Released_Year, and IMDB_Rating of all 
# movies directed by 'Steven Spielberg'
################################################################

####################################################################
# get the top 10 directors, based on the number of movies directed
####################################################################


####################################################################
# ggplot preview -- ggplot is a framework for generating 
# visualizations, based on the idea of adding layers to a chart.

# The code below generates a bar graph of average IMDB Ratings
# for the top directors according to rating, for those who have
# directed at least 5 movies
####################################################################

library(ggplot2)

# get ratings
ratings <- imdb %>% group_by(Director) %>% 
  summarize(n = n(), avg_rating = mean(IMDB_Rating)) %>%
  filter(n >= 5) %>% arrange(desc(n)) %>% top_n(5)
         
# ggplot code - note that we literally add layers to the graph
ggplot(ratings, # the dataframe containing the data to plot
       aes(x = Director, y = avg_rating, fill = Director)) + # sets aesthetics (x,y, fill values)
     geom_col(show.legend = FALSE) +  # add bar graph
     ggtitle("Best Directors") +      # add title
     ylab("Average IMDB Rating") +    # add y-axis label
     geom_label(aes(y = 5, label = paste0(n, ' movies')),
                show.legend = FALSE) + # add labels for number of movies
     theme_linedraw() # set theme
               

