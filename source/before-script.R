## To be loaded before each chapter
rm(list = ls(all = TRUE))
library(knitr)
library(tidyverse)
library(kableExtra)


knitr::opts_chunk$set(
  collapse = TRUE,
  cache = FALSE,
  fig.align="center",
  fig.pos="t",
  strip.white = TRUE,
  tidy = TRUE
  )
set.seed(2016)
# options(digits = 4)
options(dplyr.print_min = 4, dplyr.print_max = 4)
