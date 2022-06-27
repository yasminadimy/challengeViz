## code to prepare `mydata` dataset goes here
communeData <- readLines("../../../../Downloads/communes-de-corse-en-corse-et-francais.geojson") %>% paste(collapse = "\n")
usethis::use_data(communeData, overwrite = TRUE)


topoData <- readLines("../../../../Downloads/voies-ferrees.geojson") %>% paste(collapse = "\n")
usethis::use_data(topoData, overwrite = TRUE)


routesPrimData <- readLines("../../../../Downloads/routes-primaires.geojson") %>% paste(collapse = "\n")
usethis::use_data(routesPrimData, overwrite = TRUE)

