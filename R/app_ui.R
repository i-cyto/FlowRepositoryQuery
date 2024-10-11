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
        div(style = "display: flex; align-items: center; justify-content: space-between;padding-top: 10px;",
            h2(tags$strong("FlowRepository Query"))
            ,a(href = "https://github.com/i-cyto/FlowRepositoryQuery", target = "_blank",
              img(src = "img/hex.png", alt = "", width = "90")
            )
        )
      ),
      tabsetPanel(
        id = "tabs",
        tabPanel(
          "By markers",
          tags$br(),
          fluidRow(
            column(
              width = 12,
              includeHTML(file.path(app_sys(), "app/www/insert.html"))
            )
          ),
          tags$br(),
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
          "Help",
          includeHTML(file.path(app_sys(), "app/www/about.html"))
        ),
        tabPanel(
          "About",
          includeHTML(file.path(app_sys(), "app/www/context.html"))
        ),
        tabPanel(
          "FAQ", 
          h3("Questions", class = "western", style = "line-height: 200%"),
          fluidRow(
            column(
              width = 12,
              includeHTML(file.path(app_sys(), "app/www/questions.html"))
            )
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
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )
  add_resource_path(
    "img",
    app_sys("img")
  )

  tags$head(
    includeHTML(app_sys("app/www/google_analytics.html")), 
    activate_js(),
    favicon(ext = "png"),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "FlowRepository Query"
    )
  )
}
