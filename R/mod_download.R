#' download UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_download_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidPage(
      uiOutput(ns("downloadSelection"))
    )
  )
}

#' download Server Functions
#'
#' @noRd
mod_download_server <- function(id, r_global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    infos_extract <- reactiveValues()

    output$downloadSelection <- renderUI({
      req(r_global$tbl_to_export)

      tagList(
        fluidRow(
          column(
            width = 2,
            downloadButton(ns("active_downloadSelection"), "download"),
            textOutput(ns("file_name"))
          ),
          column(
            width = 10,
            uiOutput(ns("experiment_number"))
          )
        )
      )
    })
    observe({
      req(r_global$tbl_to_export)

      infos_extract$unique_experiment <- r_global$tbl_to_export[["ExpID"]] |>
        unique() |>
        length()
    })


    output$experiment_number <- renderUI({
      h4(tags$strong(
        "Found ", infos_extract$unique_experiment, " experiments"
      ))
    })

    current_filename <- reactive({
      sprintf("fr%s_%s.xlsx",FlowRepositoryQuery::fr_tbl_version, paste0(r_global$markers_to_export, collapse = "_"))
    })
    
    output$active_downloadSelection <- downloadHandler(
      filename = function() {
        current_filename()
      }, content = function(file) {
        tryCatch(
          {
            writexl::write_xlsx(r_global$tbl_to_export, path = file)
          },
          error = function(e) {
            showNotification("Error: Unable to write the file. Please try again.", type = "error")
            message("Error: ", e$message)
          }
        )
      }
    )
    
    output$file_name <- renderText({
      current_filename()
    })
  })
}
