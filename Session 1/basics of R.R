1 + 2

4/2

(2 + 2) *3

class(4)

class(4L)

4%/%3

5%%3

5%/%3

2**3

2^3

3*2

3**3

"String"



x <-  2

x


1:100


length("air")

length(c("air", "force"))

length(c("air", "force", "one"))

nchar("air")

nchar(c("air", "force"))
      
nchar(c("air", "force", "one"))


ind <-  1: 3423

ind[435]


div3 <-  1:50


div3%%3==0

list(div3[div3%%3==0])


# This is a comment 

sqr <- function(x)x|>y
sqr(4)  

rev(1:5)


pp <- function(x)data.frame(a)|>f()
library(gapminder)
library(ggplot2)

ggplot(pp(gapminder))



f <- factor(c("poor", 
              "fair", 
            "good",
            "very good",
            "excellent",
            "outstanding"), levels = c("poor", 
                                       "fair", 
                                       "good",
                                       "very good",
                                       "excellent",
                                       "outstanding"), ordered = T)

f

v <- 1:4

names(v) <- LETTERS[1:4]

v
ff <- factor(LETTERS[1:4])

library(magrittr)

rnorm(4) %>% data.frame(x = ., y = abs(.))

