## Data Manipulation with dplyr in R

# Comments are in English for better accessibility to foreign users. Documentation will be in pt-BR.
# Os comentários estão em inglês para melhor acessibilidade a usuários estrangeiros. A documentação estará em pt-BR.

## Install package
install.packages("dplyr")
install.packages("gapminder")

library(dplyr)
library(gapminder)

## Look at the gapminder dataset and check the structure
gapminder
glimpse(gapminder)
str(gapminder) # This will give the same result

## The select verb

# Select the country and continent columns
gapminder %>%
  select(country, continent)

# Store the result in a varible called country_con
country_con <- gapminder %>%
  select(country, continent)

country_con

## The filter verb

# Filter the gapminder dataset for the year 1962
gapminder %>%
  filter(year == 1962)

# Filter for China in 2002
gapminder %>%
  filter(year == 2002, country == "China")
