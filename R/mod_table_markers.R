#' table_markers UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_table_markers_ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("name_match"))
  )
}

#' table_markers Server Functions
#'
#' @noRd
mod_table_markers_server <- function(id, r_global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    infos_extract <- reactiveValues()

    output$name_match <- renderUI({
      req(r_global$tbl_to_export)
      fluidPage(
        uiOutput(ns("markers_table_count_ui"))
      )
    })

    observe({
      req(r_global$tbl_to_export)

      infos_extract$marker_columns <- r_global$tbl_to_export[, c(r_global$markers_to_export), drop = FALSE]

      infos_extract$list_table_vector <- lapply(infos_extract$marker_columns, function(x) sort(table(x), decreasing = T))
    })



    output$markers_table_count_ui <- renderUI({
      markers_table_count <- infos_extract$list_table_vector

      header_row <- fluidRow(
        column(width = 1, h4(tags$strong("Marker"))),
        column(width = 11, h4(tags$strong("Matches (count)")))
      )

      html_output <- lapply(names(markers_table_count), function(col_name) {
        row_html <- paste0(paste0(names(markers_table_count[[col_name]]), " (",
          markers_table_count[[col_name]], ")",
          collapse = ", "
        ), tags$br())

        fluidRow(
          column(width = 1, h4(col_name)),
          column(width = 11, HTML(row_html), tags$br())
        )
      })

      do.call(tagList, list(header_row, html_output))
    })
  })
}
