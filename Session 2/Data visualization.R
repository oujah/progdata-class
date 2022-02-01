library(tidyverse)
library(palmerpenguins)

names(penguins)
dim(penguins)

# First we will make a scatter plot

pengs <- select(penguins, "body_mass_g", "flipper_length_mm", "sex", "bill_depth_mm")
colnames(pengs) <- c("bm","fl","sex", "bd")
pengs <- na.omit(pengs)
ggplot(pengs) +
aes(x = fl, y = bm) + 
geom_point(color = "blue", alpha = 0.6) + 
  scale_x_continuous(name = "Flipper Length") + 
  scale_y_continuous(name = "Body mass") + 
  theme_gray()

library(tibble)
library(dplyr)

# Make a line chart
#---------------------------
# install.packages("tsibble")
mauna <- tsibble::as_tsibble(co2) |> rename(month = index, conc = value)

p <-ggplot(mauna) +
  aes(x = month, y = conc) +
  geom_line() + 
  tsibble::scale_x_yearmonth()

# Task: Make a Scatter plot
#---------------------------------
ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_length_mm) + 
  geom_point(aes(color = species)) + 
  geom_smooth()

# Mappling color in the global call for the plot
ggplot(palmerpenguins::penguins, aes(color = species)) +
  aes(x = body_mass_g, y = bill_length_mm) + 
  geom_point() + 
  geom_smooth()

p + geom_smooth(color = "dark green")

# Fix problem -> Fixed
library(gapminder)
ggplot(gapminder) +
  aes(x = gdpPercap, y = lifeExp, alpha = 0.1)+
  geom_point()

ggplot(cars) +
  aes(x = speed, y = dist) + 
  geom_point(color = "blue")

# Bar Chart

theme_set(theme_grey())

ggplot(penguins) + 
  aes(x = species, fill = species) +
  geom_bar()

#Stacked Bar

ggplot(penguins) +
  aes(y = island, color = fct_rev(species),
      fill = fct_rev(species),
      label = fct_rev(species)) + 
  stat_count(orientation = "y") +
  guides(color = guide_none(),
         fill = guide_none()) +
  ylab(NULL) +
  stat_count(geom = "label",
             color = "white")

#Pie Chart

ggplot(penguins) +
  aes(x = factor(1),
      fill = species,
      label = species) +
  geom_bar(width = 1) + 
  stat_count(geom = "text",
             size = 5,
             color = "white",
             position = position_stack(vjust = .5)) +
  guides(y = guide_none(),
         x = guide_none(),
         fill = guide_none()) +
  xlab(NULL) +
  ylab(NULL) +
  coord_polar(theta = "y") + 
  theme(axis.text = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank())

# Histogram

ggplot(penguins) + 
         aes(bill_length_mm) +
         geom_histogram(binwidth = 1)

# Density
ggplot(penguins) + 
  aes(bill_length_mm) +
  geom_density()

# Dot Plot
ggplot(penguins) + 
  aes(bill_length_mm) +
  geom_dotplot(binwidth = 1, dotsize = 0.5) + 
  guides(y = guide_none())

# Scatter plot 1

ggplot(penguins) +
  aes(x = bill_length_mm, y = flipper_length_mm) +
  geom_point()

# Scatter plot 2

ggplot(penguins) +
  aes(x = bill_length_mm, y = flipper_length_mm, 
      fill = species, 
      color = species,
      shape = species) +
  geom_point()


# Scatter plot 3

ggplot(penguins) +
  aes(x = bill_length_mm, y = flipper_length_mm, 
      fill = species, 
      color = species,
      shape = sex,
      size = body_mass_g) +
  geom_point()

# More scatterplots

#install.packages("alr4")
                 
ggplot(round(alr4::Heights))+
  aes(x = mheight,
      y = dheight) + 
  geom_point()

# Scatterplot 5

#install.packages("alr4")

ggplot(round(alr4::Heights))+
  aes(x = mheight,
      y = dheight) + 
  geom_jitter(height = 0.3, width = 0.3)

# Scatter plot 6

ggplot(penguins) +
  aes(x = species, y = flipper_length_mm, 
      color = species,
      fill =species) + 
  geom_point()

# Scatterplot 7
ggplot(penguins) +
  aes(x = species, y = flipper_length_mm, 
      color = species,
      fill =species) + 
  geom_jitter(height = 0,
              width = 0.4)

# Scatterplot 8
ggplot(penguins) +
  aes( x = species,
       y= flipper_length_mm,
       fill = species,
       color = species) +
  geom_jitter(height = 0, width = 0.4) +
  geom_boxplot(color = "black", alpha = 0.5)

# Raincloud plot
ggplot(na.omit(penguins)) + 
  aes(y = species,
      x = flipper_length_mm,
      fill = species,
      color =species) +
  geom_jitter(height = .15) +
  geom_boxplot(color = "black",
               alpha = 0.5,
               width = 0.1,
               size = 0.5)+
  ggdist::stat_slab(height = 0.3,
                    color = "black",
                    size = 0.2,
                    alpha =0.5)
 
# Scattterplots for change

df <- data.frame(id = 1:30,
                 before = rnorm(30),
                 after = rnorm(30))

df <- tidyr::pivot_longer(df, -id,names_to = "time",
                          values_to = "score")
ggplot(df) +aes(x = time, y = score,group = id) +geom_point()+geom_line()


dr <-  data.frame(
  g = c(rep("a", times = 100),
        rep("b", times = 100),
        rep("c", times = 100),
        rep("d", times = 100),
        rep("e", times = 100)),
  z = c(rnorm(100, mean = 0, sd = 1),
      rnorm(100, mean = 1, sd = 2),
      rnorm(100, mean = 2, sd = 3),
       rnorm(100, mean =3, sd = 4),
        rnorm(100, mean = 4, sd = 5)))

# Overlapping densities

ggplot(dr) +
  aes(x = z,
      group = g,
      fill = g) +
  geom_density(size = 0.2, alpha = 0.5)


# Ridge plot
ggplot(dr) +
   aes(x = z,
       y = g,
       fill = g) +
  ggridges::geom_density_ridges(size = 0.2, alpha = 0.5, scale = 4)

peng.focal <- penguins[,c("species", 
                          "bill_length_mm",
                          "flipper_length_mm",
                          "sex")]
pairs(peng.focal)

GGally::ggpairs(peng.focal,
              mapping = aes(color = species, alpha = 0.5),
              lower = list(
                continous = "smooth_loess",
                combo = "facethist",
                discrete ="facetbar",
                na = "na")) + theme_classic()

ggplot(penguins) + 
  aes(x = bill_length_mm,
      y = flipper_length_mm,
      fill = species,
      color =species) +
  geom_point()+
geom_smooth(color = "black ", fill = "black")


ggplot(penguins) + 
  aes(x = bill_length_mm,
      y = flipper_length_mm,
      fill = species,
      color =species) +
  geom_point()+
  geom_smooth(color = "black ", fill = "black") +
  geom_smooth(method = "lm", color = "orange", fill = "orange")


ggplot(penguins) + 
  aes(x = bill_length_mm,
      y = flipper_length_mm,
      fill = species,
      color =species) +
  geom_point()+
  geom_smooth()

ggplot(penguins) + 
  aes(x = bill_length_mm,
      y = flipper_length_mm,
      fill = species,
      color =species) +
  geom_point()+
  geom_smooth()+
  geom_smooth(method = "lm", color = "black", linetype = "dashed")


ggplot(penguins) + 
  aes(x = bill_length_mm,
      y = flipper_length_mm,
      fill = species,
      color =species) +
  geom_point()+
  geom_smooth(method = "lm",  linetype = "dashed")+
  geom_smooth(color = "black", fill = "black", alpha = 0.2) +
  geom_smooth(method = "lm",  fill = "orange", color = "orange", alpha = 0.2)

ggplot(penguins) + 
  aes(y = bill_length_mm,
      x = flipper_length_mm,
      fill = species,
      color =species,
      linetype = species,
      shape = species) +
  geom_point(alpha = 0.7) + 
  geom_smooth() +
  theme_bw() +
  theme(legend.position = "bottom")



