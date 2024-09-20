#' subset UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_subset_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("fr_datasets_agg_panel"), tags$strong("Search"))
  )
}

#' subset Server Functions
#'
#' @noRd
mod_subset_server <- function(id, r_global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    TABLE <- reactiveVal(NULL)
    MARKERS <- reactiveVal(NULL)

    observeEvent(input$fr_datasets_agg_panel,
      {
        req(r_global$marker_list_text)
        markers <- r_global$marker_list_text
        # for (markers in list_markers) {
        # panels
        panels <- FlowRepositoryQuery::fr_datasets_agg_panel$Panel
        # query antibodies
        ok <- rep(TRUE, nrow(FlowRepositoryQuery::fr_datasets_agg_panel))
        # coarse loop: search as strings, ie CD3 is found in CD33
        for (mrk in markers) {
          
          ok_mrk <-tryCatch({
            
            grepl(mrk, panels[ok], ignore.case = TRUE)
            
          }, error = function(e) {
            
            showNotification(paste("Error: Invalid regular expression -", e$message), type = "error")
            validate(need(FALSE, "An error occurred with the regular expression. Execution has been stopped."))
            
            })
          
          ok[ok] <- ok_mrk
        }
        table(ok)
        # fine loop: search as words, ie CD3 is not CD33
        for (mrk in markers) {
          qry1 <- sprintf("%s[^0-9a-zA-Z]", mrk)
          ok_mrk1 <- grepl(qry1, panels[ok], ignore.case = TRUE)
          qry2 <- sprintf("%s(\\||$)", mrk)
          ok_mrk2 <- grepl(qry2, panels[ok], ignore.case = TRUE)
          ok[ok] <- ok_mrk1 | ok_mrk2
        }
        table(ok)
        # report exact words found
        res <- Reduce(cbind.data.frame, lapply(markers, function(mrk) {
          unlist(lapply(panels, function(panel) {
            x <- strsplit(panel, "|", fixed = TRUE)[[1]]
            qry1 <- sprintf("%s[^0-9a-zA-Z]", mrk)
            ok_mrk1 <- grepl(qry1, x, ignore.case = TRUE)
            qry2 <- sprintf("%s$", mrk)
            ok_mrk2 <- grepl(qry2, x, ignore.case = TRUE)
            res <- x[ok_mrk1 | ok_mrk2]
            ifelse(length(res), paste(res, collapse = "|"), NA)
          }))
        }))
        if (is.null(dim(res))) {
          res <- as.data.frame(res)
        }
        colnames(res) <- markers
        ok_alt <- apply(res, 1, function(x) !any(is.na(x)))
        # cross-validation
        table(ok_alt, ok)

        TABLE(cbind(FlowRepositoryQuery::fr_datasets_agg_panel, res)[which(ok_alt), ])
        MARKERS(markers)
      },
      ignoreNULL = FALSE
    )


    observe({
      r_global$tbl_to_export <- TABLE()
    })
    observe({
      r_global$markers_to_export <- MARKERS()
    })
  })
}
