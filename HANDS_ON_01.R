# SCRIPT + STUDENT INFO ---------------------------------------------------
# NOMBRE :Pablo Bailador Pollo
# EXP:22273714
# TEMA:HANDS_ON_01


# LOADING LIBS ------------------------------------------------------------

install.packages (c("tidyverse", "dplyr"))
library(dplyr)

# LOADING DATA ------------------------------------------------------------

exp_22273714<-jsonlite::fromJSON("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")

# SHORTCUTS ---------------------------------------------------------------

# CLEAN CONSOLE = CTRL + L
# %>% = pipe generator = SHIFT + CTRL + M
# NEW INDEX = SHIFT + CTRL + R
# CTRL + ENTER = run line


# GIT COMMANDS ------------------------------------------------------------

# git status = info about a repo
# git commit = Add a comment
# git add . = Add the curent dir to the entire repo
# git push -u origin main = send to the remote repo (Github)


# CLI COMMANDS ------------------------------------------------------------

# pwd = shows the current dir location
# ls = list terminal
# mkdir = create a dir
# cd = change dir


# BASIC INSTRUCTION ----------------------------------------------------------

pablo<-8 # assigning values


# TIDYVERSE COMMANDS ------------------------------------------------------

exp_22273714 %>% glimpse() %>% View()
