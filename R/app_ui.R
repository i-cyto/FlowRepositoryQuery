#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    fixedPage(
      titlePanel(
        h2(
          HTML(paste0(tags$strong("FlowRepository query"))), # style="text-align:center"
        )
      ),
      tabsetPanel(
        tabPanel(
          "by markers", tags$br(),
          fluidRow(
            column(
              width = 12,
              mod_textarea_ui("textarea")
            )
          ),
          fluidRow(
            column(
              width = 12,
              mod_download_ui("download"),
              tags$br(),
              mod_table_markers_ui("show_marker_tables")
            )
          )
        ),
        tabPanel(
          "help", 
          includeHTML(file.path(app_sys(),"about.html"))
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
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  

  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "FlowRepository query"
    )
  )
}
