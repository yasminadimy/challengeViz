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

    thecarte <- leaflet()  %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = 9.012893, lat = 42.02, zoom = 9) %>%
      addCircleMarkers(data = challengeViz::communeData ,~Long, ~Lat,
                 popup = ~as.character(`Nom corse`) ,
                 label = ~as.character(`Nom corse`),
                 radius = 3,
                 color = "grey",
                 stroke = FALSE,
                 fillOpacity = 1)
    # View mode
    if("🚂" %in% input$moyentransport){
      thecarte <- thecarte %>%
        addGeoJSON(challengeViz::topoData, weight = 4, color = "#E08AF4", fill = FALSE)
    }
    if("🚙" %in% input$moyentransport){
      thecarte <- thecarte %>%
        addGeoJSON(challengeViz::routesPrimData, weight = 4, color = "#00D1B0", fill = FALSE)
    }

    if("🚲" %in% input$moyentransport){
        thecarte <- thecarte %>%
          addGeoJSON(challengeViz::pistesCyclData, weight = 4, color = "#0093FF", fill = FALSE)
      }

    thecarte
  })

}
