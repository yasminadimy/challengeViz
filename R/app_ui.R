#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import leaflet
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      dashboardHeader(title = "Train station dashboard"),
      dashboardSidebar(),
      dashboardBody(
        # Boxes need to be put in a row (or column)
        fluidRow(
          bs4Card(
            title = "Corsica roads",
            status = "primary",
            solidHeader = FALSE,
            collapsible = FALSE,
            elevation = 4,
            width = NULL,
            leafletOutput("carte", height = 600, width = 600)
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @import bs4Dash
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "challengeViz"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
