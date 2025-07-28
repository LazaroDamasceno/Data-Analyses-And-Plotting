library(tidyverse)

egdi <- read.csv('EGOV_DATA_2024.csv') %>%
  arrange(Country.Name)

gdp <- read.csv('gdp_percapita_ppp.csv') %>% 
  select(Country.Name, X2024) %>%
  mutate(Country.Name = case_when(
    Country.Name == "Korea, Rep." ~ "Republic of Korea",
    Country.Name == "Turkiye" ~ "Türkiye",
    Country.Name == "St. Lucia" ~ "Saint Lucia",
    Country.Name == "United Kingdom" ~ "United Kingdom of Great Britain and Northern Ireland",
    Country.Name == "Tanzania" ~ "United Republic of Tanzania",
    Country.Name == "Venezuela, RB" ~ "Venezuela",
    Country.Name == "Slovak Republic" ~ "Slovakia",
    Country.Name == "Egypt, Arab Rep." ~ "Egypt",
    Country.Name == "Lao PDR" ~ "Lao People's Democratic Republic",
    Country.Name == "Micronesia, Fed. Sts." ~ "Micronesia (Federated States of)",
    Country.Name == "Moldova" ~ "Republic of Moldova",
    Country.Name == "Bahamas, The" ~ "Bahamas",
    Country.Name == "Yemen, Rep." ~ "Yemen",
    Country.Name == "Gambia, The" ~ "Gambia",
    Country.Name == "Georgia" ~ "Georgia (Country)",
    Country.Name == "Iran, Islamic Rep." ~ "Iran (Islamic Republic of)",
    Country.Name == "United States" ~ "United States of America",
    Country.Name == "Congo, Rep." ~ "Congo",
    Country.Name == "Cote d'Ivoire" ~ "Côte d'Ivoire",
    Country.Name == "Czechia" ~ "Czech Republic",
    Country.Name == "Kyrgyz Republic" ~ "Kyrgyzstan",
    Country.Name == "St. Kitts and Nevis" ~ "Saint Kitts and Nevis",
    Country.Name == "St. Vincent and the Grenadines" ~ "Saint Vincent and the Grenadines",
    Country.Name == "Korea, Dem. People's Rep." ~ "Democratic People's Republic of Korea",
    Country.Name == "Congo, Dem. Rep." ~ "Democratic Republic of the Congo",
    TRUE ~ Country.Name
  )) %>% 
  filter(Country.Name %in% egdi$Country.Name) %>%
  arrange(Country.Name)

df <- data.frame(
  gdp = gdp$X2024,
  egdi = egdi$E.Government.Index
)

ggplot(df, aes(x=egdi, y=gdp)) +
  geom_point() +
  geom_smooth(method='lm') +
  scale_x_continuous(limits = c(0, 1)) +
  labs(
    title="Linear Regression: GDP per capita PPP x EGDI",
    x="EGDI",
    y='GDP'
  )

cor(df$gdp, df$egdi, method=c('spearman'))
