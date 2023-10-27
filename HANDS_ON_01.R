# SCRIPT + STUDENT INFO ---------------------------------------------------
# NOMBRE :Pablo Bailador Pollo
# EXP:22273714
# TEMA:HANDS_ON_01


# LOADING LIBS ------------------------------------------------------------

install.packages (c("tidyverse", "dplyr", "janitor", "xlsx", "readxl"))
library(dplyr)
library(janitor)
library(readr)
library(readxl)


# LOADING DATA ------------------------------------------------------------

exp_22273714<-jsonlite::fromJSON("https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/")
ruta_ccaa <- "C:/Users/Pablo/UEM/TERCERO/PRIMER_SEMESTRE/Lenguaje_programación/codccaa_OFFCIAL.xls"
codccaa_OFFCIAL <- read_excel(ruta_ccaa)
codccaa_OFFCIAL %>% View()


# SHORTCUTS ---------------------------------------------------------------

# CLEAN CONSOLE = CTRL + L
# %>% = pipe generator = SHIFT + CTRL + M
# NEW INDEX = SHIFT + CTRL + R
# CTRL + ENTER = run line
# assign value = ALT + -


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


# 27 DE SEPTIEMBRE --------------------------------------------------------

str(exp_22273714) # get datatype
df <- exp_22273714$ListaEESSPrecio # get readable data
df %>% glimpse()

df %>% janitor::clean_names() %>% glimpse()

# fin de la clase de hoy, siguiente hacemos la entrega.


# WORKING W PIPES ---------------------------------------------------------


cd <- df %>%   janitor::clean_names() %>% glimpse()
clean_data <-  df %>% readr::type_convert(locale = readr::locale(decimal_mark = ",")) %>% janitor::clean_names()
clean_data %>% View()


# DEALING W DATA ----------------------------------------------------------

villa_boa_gas <- clean_data %>% select(precio_gasoleo_a, rotulo, direccion, localidad) %>% 
  filter(localidad=="VILLAVICIOSA DE ODON"|localidad=="BOADILLA DEL MONTE") %>% 
  arrange(precio_gasoleo_a) %>% View()

gaso_barata_madrid <- clean_data %>% select(precio_gasoleo_a, rotulo, direccion, localidad, provincia) %>% 
  filter(provincia=="MADRID") %>% 
  arrange(precio_gasoleo_a) %>% write.csv("gaso_barata_madrid.xls")

ballenoil_barata_madrid <- clean_data %>% select(precio_gasoleo_a, rotulo, direccion, localidad, provincia) %>% 
  filter(rotulo=="BALLENOIL") %>% 
  filter(provincia=="MADRID") %>%
  arrange(precio_gasoleo_a) %>% View()


resultados_ejercicio <- clean_data %>% select(precio_gasoleo_a, rotulo, direccion, localidad, provincia) %>% 
  group_by(rotulo) %>%
  summarise(media_precio = mean(precio_gasoleo_a, na.rm = TRUE)) %>%
  arrange(media_precio) %>%View()


# STORING DATA ------------------------------------------------------------

write.csv(gaso_barata_madrid, "gaso_barata_madrid.csv")
xlsx::write.xlsx(gaso_barata_madrid, "gaso_barata_madrid_2.xlsx")

# INFORME_MADRID <- readxl::(gaso_barata_madrid, "gaso_barata_madrid.xlsx")


# DEALING W COLS ----------------------------------------------------------

clean_data %>% 
  mutate(low_cost = !rotulo %in% c("REPSOL", "CEPSA", "Q8", "BP", "SHELL", "CAMPSA", "GALP")) %>% View





# 27/10/23 - CCAA Y PROVINCIAS --------------------------------------------



codccaa_OFFCIAL <- codccaa_OFFCIAL %>% slice(-1)
codccaa_OFFCIAL %>% View()



codccaa_OFFCIAL <- codccaa_OFFCIAL %>% 
  rename(idccaa = "Relación de comunidades y ciudades autónomas con sus códigos")




clean_data <- clean_data %>% 
  left_join(codccaa_OFFCIAL, by = "idccaa")

clean_data %>% View()





