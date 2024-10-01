#' textarea UI Function
#'
#' @description define list_markers with textAreaInput
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_textarea_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      style = "display: flex; align-items: center;",
      # (",", " ", "|" or line break separated)
      textAreaInput(ns("MarkerText"), "Markers of Interest",
        width = "1000px", height = "100px"
      ),
      div(
        mod_subset_ui(ns("button")),
        style = "margin-left: 10px;"
      )
    )
  )
}

#' textarea Server Functions
#'
#' @noRd
mod_textarea_server <- function(id, r_global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    mod_subset_server("button", r_global)


    MarkerList <- reactive({
      split_markers <- unlist(strsplit(input$MarkerText, "[,\n \\|]"))

      cleaned_markers <- unique(trimws(split_markers))

      cleaned_markers <- cleaned_markers[cleaned_markers != ""]

      return(cleaned_markers)
    })

    observe({
      r_global$marker_list_text <- MarkerList()
    })
  })
}
