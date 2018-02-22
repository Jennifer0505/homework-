#10.5-1 Excercise
library("tidyverse")
mtcarss<- as_tibble(mtcars)
print(mtcarss)

#2
df <- data.frame(abc = 1, xyz = "a")
df$x
class(df[, "xyz"])
class(df[, c("abc", "xyz")])
tb_df <- as_tibble(df)
tb_df$x
class(tb_df[, "xyz"])
class(tb_df[, c("abc", "xyz")])

#3
tb_cars <- as_tibble(mtcars)
var <- "mpg"
tb_cars[var]
mtcars[var]

#4
annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)
annoying$`1`
ggplot(data = annoying) +
  geom_point(aes(x = `1`, y = `2`))
mutate(annoying, `3` = `2` / `1`)
transmute(annoying, one = `1`, two = `2`, three = `3`)

#5
# Converting atomic vectors to data frames, and vice versa
# For backwards compatibility with data frames
help(enframe)

#6
# tibble.max_extra_cols
# Number of extra columns printed in reduced form. Default: 100.
package?tibble


----------------------------------------------------------
#12.6.1 Excercise
#1
##look at the number of years of recorded data for each country
who %>%
  group_by(country) %>%
  summarize(count = n()) %>%
  ggplot() +
  geom_point(mapping = aes(x = country, y = count), color = 'green') +
  coord_flip()
##check if there are any 0 recorded cases
sum(who %>% select(-c(1:4)) == 0, na.rm = TRUE)
##check the number of NAs in each column
who %>% select(-c(1:4)) %>%
  sapply(function(x){sum(is.na(x))})
##These NAs are explicitly stated as missing values.In a given year for a country, there are both missing and non-missing cases.


#2
##The code will not be separated properly into the three columns new, var, and sexage.

#3
who %>% select(1:3) %>% sapply(function(x){length(unique(x))})
who %>% select(1:3) %>%
  unite(combined, 1:3) %>%
  select(combined) %>%
  distinct() %>%
  nrow()
##Therefore, we can confirm that for each country, there is only one iso2 code, and also one iso3 code. iso2 and iso3 are redundant columns.

#4
who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  group_by(country, year, sex) %>%
  summarize(total_case = sum(value)) %>%
  unite(country_sex, country, sex, remove = FALSE) %>%
  ggplot() +
  geom_line(mapping = aes(x = year, y = total_case, color = sex,
                          group = country_sex))

who %>%
  gather(code, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(code = stringr::str_replace(code, "newrel", "new_rel")) %>%
  separate(code, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1) %>%
  group_by(country, year, sex) %>%
  summarize(total_case = sum(value)) %>%
  filter(country == 'China') %>%
  ggplot() +
  geom_line(mapping = aes(x = year, y = total_case, color = sex,
                          group = country))

