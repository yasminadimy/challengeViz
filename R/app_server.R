#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import leaflet
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  set.seed(122)
  output$carte <- renderLeaflet({
    leaflet()  %>%
      addTiles() %>%
      setView(lng = 9.012893, lat = 42.02, zoom = 9) %>%
      addGeoJSON(challengeViz::topoData, weight = 1, color = "#444444", fill = FALSE) %>%
      addGeoJSON(challengeViz::communeData, weight = 1, color = "#444444", fill = FALSE) %>%
      addGeoJSON(challengeViz::routesPrimData, weight = 10, color = "blue", fill = FALSE)
  })

}
