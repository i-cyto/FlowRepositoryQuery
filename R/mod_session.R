#' session UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_session_ui <- function(id) {
  ns <- NS(id)
  tagList(
    "There are currently",
   div( textOutput(ns("count")), 
               class="session-count"),
    "session(s) connected to this app."
  )
}

#' session Server Functions
#'
#' @noRd
mod_session_server <- function(id, vals) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$count <- renderText({
      vals$count
    })
  })
}
