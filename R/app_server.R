#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  isolate(vals$count <- vals$count + 1)

  r_global <- reactiveValues()

  mod_textarea_server("textarea", r_global)

  mod_download_server("download", r_global)

  mod_table_markers_server("show_marker_tables", r_global)

  observeEvent(input$go_to_help, {
    updateTabsetPanel(session, "tabs", selected = "Help")
  })

  session$onSessionEnded(function() {
    isolate(vals$count <- vals$count - 1)
  })

  mod_session_server("session_count", vals)
}
