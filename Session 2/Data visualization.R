library(tidyverse)
library(ggplot2)

attach(mtcars)

mtcars$mpg <- as.numeric(mtcars$mpg)
mtcars$wt <- as.numeric(mtcars$wt)

ggplot(mtcars)

ggplot(mtcars) + aes(x = wt, y = mpg)

q <- ggplot(mtcars) + 
  geom_point(mapping = aes(x = wt, y = mpg)) + 
  xlab("Weight, lb") +
  ylab("Miles per gallon (mpg)") +
  ggtitle("Simple scatterplot")