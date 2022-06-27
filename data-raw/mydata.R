## code to prepare `mydata` dataset goes here

library(tidyverse)
communeData <- readLines("../../../../Downloads/communes-de-corse-en-corse-et-francais.geojson") %>% paste(collapse = "\n")
usethis::use_data(communeData, overwrite = TRUE)


topoData <- readLines("../../../../Downloads/voies-ferrees.geojson") %>% paste(collapse = "\n")
usethis::use_data(topoData, overwrite = TRUE)


routesPrimData <- readLines("../../../../Downloads/routes-primaires.geojson") %>% paste(collapse = "\n")
usethis::use_data(routesPrimData, overwrite = TRUE)

pistesCyclData <- readLines("../../../../Downloads/amenagements-cyclables-en-corse.geojson") %>% paste(collapse = "\n")
usethis::use_data(pistesCyclData, overwrite = TRUE)


communeData <- readr::read_delim("../../../../Downloads/communes-de-corse-en-corse-et-francais.csv", delim = ";") %>%
  separate("point_geo", c("Lat", "Long"), sep = ",", remove = FALSE) %>%
  mutate(across(c("Long", "Lat"), as.numeric))
usethis::use_data(communeData, overwrite = TRUE)



patrimoineNatData <- readr::read_delim("../../../../Downloads/patrimoine-naturel-corse.csv", delim = ";") %>%
  separate("localisation", c("Lat", "Long"), sep = ",", remove = FALSE) %>%
  mutate(across(c("Long", "Lat"), as.numeric))
usethis::use_data(patrimoineNatData, overwrite = TRUE)

patrimoineCultData <- readr::read_delim("../../../../Downloads/patrimoine-culturel-points-dinterets-en-corse.csv", delim = ";") %>%
  separate("localisation", c("Lat", "Long"), sep = ",", remove = FALSE) %>%
  mutate(across(c("Long", "Lat"), as.numeric))
usethis::use_data(patrimoineCultData, overwrite = TRUE)



patrimoine <- patrimoineCultData %>%
  select(Secteur, Lieu, Catégorie, Nom, cp, ville, localisation, Lat, Long) %>%
  mutate(patrimoine = "Culturel") %>%
  rbind(patrimoineNatData %>% select(Secteur, Lieu, Catégorie, Nom, cp, ville, localisation, Lat, Long) %>%
          mutate(patrimoine = "Naturel"))
usethis::use_data(patrimoine, overwrite = TRUE)

