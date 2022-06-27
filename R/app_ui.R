#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import leaflet
#' @import shinyWidgets
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      dashboardHeader(title = "Train station dashboard"),
      sidebar = bs4DashSidebar(
        skin = "light",
        status = "primary",
        elevation = 3,
        opacity = 0.8
        ),
      dashboardBody(
          # Show a plot of the generated distribution
          fluidRow(column(width = 2,
                          verbatimTextOutput("currentpos"))),
          # Show a plot of the generated distribution
          fluidRow(
          checkboxGroupButtons(
            inputId = "moyentransport",
            label = "Which transport mode you want to display ?",
            choices = c("🚲", "🚙", "🚂"),
            selected = c("🚲", "🚙", "🚂"),
            checkIcon = list(
              yes = icon("ok",
                         lib = "glyphicon")
            )),
          pickerInput(
            'touristiclist', label = NULL,
            choices = challengeViz::patrimoine$Nom,
            multiple = TRUE,
            options = list(
              `live-search` = TRUE)
          ),
          tableOutput("data"),
          bs4Card(
            title = "Corsica roads",
            solidHeader = FALSE,
            collapsible = FALSE,
            elevation = 4,
            width = NULL,
            leafletOutput("carte", height = 700, width = 700)
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
