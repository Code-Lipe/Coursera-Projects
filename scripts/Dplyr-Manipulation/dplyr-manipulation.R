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


## The Arrange Verb

# Sort in ascending order of lifeExp
gapminder %>%
  arrange(lifeExp)

# Sort in descending order of lifeExp and select the top fifteen
gapminder %>%
  arrange(desc(lifeExp)) %>%
  slice(1:15)

# Filter for the year 1962,
# then arrange in descending order of population
gapminder %>%
  filter(year == 1962) %>%
  arrange(desc(pop))


## The Mutate Verb

# Use mutate to chance lifeExp to be in months
gapminder %>%
  mutate(lifeExp = 12 * lifeExp)

# Use mutate to create a new column called lifeExpMonths
gapminder %>%
  mutate(lifeExpMonths = 12 * lifeExp)

# Filter, mutate and arrange the gapminder dataset
# Retrive the live expectancy in months for the year 2007.
# Store the result in a new column called lifeExpMonths
# Sort the result in descending order
gapminder %>%
  filter(year == 2007) %>%
  mutate(lifeExpMonths = 12 * lifeExp) %>%
  arrange(desc(lifeExpMonths))


## The Summarize Verb

# Summarize to find the median life expectancy
gapminder %>%
  summarise(medianLifeExp = median(lifeExp))

# Filter for 1962 then summarize  the median life expectancy
gapminder %>%
  filter(year == 1962) %>%
  summarise(medianLifeExp = median(lifeExp))

# Filter for 1962 then summarize the median life expectancy
# and the maximum GDP per capita
gapminder %>%
  filter(year == 1962) %>%
  summarise(medianLifeExp = median(lifeExp), maxGdpPerCap = max(gdpPercap))


## The Group_by Verb

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPerCap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita
# in each continent in 1962
gapminder %>%
  filter(year == 1962) %>%
  group_by(continent) %>%
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPerCap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita
# in each continent/year combination
gapminder %>%
  group_by(year, continent) %>%
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPerCap = max(gdpPercap))
