#' FlowRepositoryQuery: FowRepository.org database and query tool
#' 
#' The \code{FlowRepositoryQuery} package provides a comprehensive listing of 
#' all experiments deposited in the FlowRepository as of 2024-08-01. User also have access to a 
#' web interface that allows to easily query experiments based on their interested markers.
#'
#'
#'
#' FlowRepository is a database of flow cytometry experiments where you can query and 
#' download data collected and annotated according to the MIFlowCyt standard. 
#' It is primarily used as a data deposition place for experimental findings published
#' in peer-reviewed journals in the flow cytometry field.
#' 
#' The user can search for a marker name or regular expression separated by comma, space, pipe or line breaks. 
#' The output is not case-sensitive and the corresponding markers are displayed below with their different matches. 
#' The user will then be allowed to download a corresponding excel file.
#' 
#' 
#' @examples
#' #############################################################################
#' # Search within the running app:
#' #############################################################################
#' #
#' # cd4,cd25,cd127,fox.*p3    # will let user access the 80 experiments
#' #                           # with these four associated markers.
#' #
#' ## For complex marker names user is able to use regex annotation:
#' #
#' # t[-_]*bet          # finds all the different strings associated with T-bet
#' #                    # i.e. T-bet(72), Tbet(55) and all the names associated
#' #                    # with this marker with their florochromes/metals.
#' #
#' # pd.*l.*1           # finds markers associated with PD-L1.
#' #                    # i.e. PD-L1(34), PDL1(16) or even PDL.1(1)
#' #
#' #############################################################################
#' 
#' @seealso \code{\link{run_app}()} for launching the shiny app.
#' @name FlowRepositoryQuery-package
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
