# Part 1: Set up R and Rstudio
#---------------------------------
library(tidyverse)
library(palmerpenguins)


# Part 3: Practice some R functions
#-----------------------------------
summary(penguins) # Gives a general overview of the data set and the characteristics of the variables

head(penguins) # Exploring the first 6 observations of the data set

nrow(penguins) # Determine the number of rows in the data set

ncol(penguins) # Determine the number of columns in the data set

dim(penguins) # Determine the number of rows and columns in the data set

# Perform descriptive statistics of variables in the Penguins data set
#********************************************************************************

table(penguins$species) # Exploring the different species of penguins in the data set

table(penguins$sex) # Exploring the sex of the penguins

mean(penguins$body_mass_g, na.rm = T)

male.peng <- penguins[penguins$sex=="male",]

subset(penguins, select=c("species","island", "body_mass_g"))

       
