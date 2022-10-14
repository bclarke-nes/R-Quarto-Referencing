## ----r------------------------------------------------------------------------
library(pacman)
p_load(tidyverse, glue, stringr)
knitr::opts_chunk$set(echo = T, warning = F, message = F, results = 'asis', fig.width = 7, fig.height = 3)


## ----r------------------------------------------------------------------------
# writes Quarto code into standalone R script
try(knitr::purl(basename(knitr::current_input(dir = FALSE))))


## ----r------------------------------------------------------------------------
mtcars %>%
  summarise(across(where(is.numeric))) %>%
  knitr::kable()

