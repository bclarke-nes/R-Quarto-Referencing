## ----r------------------------------------------------------------------------
library(pacman)
p_load(tidyverse, glue, stringr,bib2df, lubridate)
knitr::opts_chunk$set(echo = T, warning = F, message = F, results = 'asis', fig.width = 7, fig.height = 3)


## ----r------------------------------------------------------------------------
# writes Quarto code into standalone R script
try(knitr::purl(basename(knitr::current_input(dir = FALSE))))


## ----r------------------------------------------------------------------------
working_bib <- bib2df("data/sample.bib")

working_bib %>%
  count(YEAR) %>%
  ggplot() +
  geom_col(aes(x=YEAR, y=n))


## ----r------------------------------------------------------------------------
head(working_bib) %>% select(1:5) %>% knitr::kable()


## ----r------------------------------------------------------------------------
working_bib %>%
  arrange(YEAR) %>%
  distinct(YEAR) %>%
  pull()


## ----r------------------------------------------------------------------------
working_bib <- working_bib %>%
  separate(YEAR, into=c("YEAR", "ORIGYEAR"), sep = " ") %>%
  mutate(ORIGYEAR = str_replace_all(ORIGYEAR, "\\(|\\)", ""))


## ----r------------------------------------------------------------------------
working_bib %>%
  mutate(YEAR = as.numeric(YEAR)) %>%
  filter(YEAR >= 1900) %>%
  ggplot() +
  geom_histogram(aes(x=YEAR, fill=CATEGORY), binwidth=5)


## ----r------------------------------------------------------------------------
df2bib(working_bib, "data/tidy.bib")

