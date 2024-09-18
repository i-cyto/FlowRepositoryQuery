#' FlowRepository columns description
#'
#' Description of FlowRepository experiment table columns.
#'
#' @format data.frame
#' \describe{
#' \item{\code{Column}}{fr table columns names}
#' \item{\code{Description}}{fr table columns description}
#' \item{\code{Origin}}{fr table columns page type}}
"dictionary_agg_panel"


#' FlowRepository FCS associated with panel
#'
#'  Table containing the name of each fcs file referenced for each FlowRepository ID and their associated panel.
#'
#' @format data.frame
#' \describe{
#' \item{\code{rep_id}}{flowrepository id}
#' \item{\code{exp_id}}{experiment id}
#' \item{\code{fcs_file}}{fcs file name}
#' \item{\code{panel}}{marker vector separated with pipes}}
"fr_panels"

#' FlowRepository Datasets Insights
#'
#' A collection of tables representing datasets from FlowRepository on \code{2024/08/01}
#'
#' \describe{
#'   \item{\code{fr_datasets}}{ Table of repository identifiers (unique identifiers) for all public datasets.}
#'   \item{\code{fr_datasets_agg_panel}}{ All experiments referenced on FlowRepository.org with marker panels.}
#' }
#'
#' @name fr_datasets
#' @format A data.frame with the following columns:
#' \describe{
#' \item{\code{RepIDurl}}{URL to the entry}
#' \item{\code{RepID}}{identifier to the entry in FR}
#' \item{\code{ExpID}}{numerical identifier, alternative to RepID}
#' \item{\code{ExpName}}{experiment name}
#' \item{\code{Purpose}}{Purpose}
#' \item{\code{Conclusion}}{Conclusion}
#' \item{\code{Comments}}{Comments}
#' \item{\code{Keywords}}{Keywords}
#' \item{\code{ManuscriptUrl}}{URL to the first filled link}
#' \item{\code{Manuscripts}}{full list of manucript id}
#' \item{\code{Design}}{for each variable of the design gives its levels/values and reports the count of FCS}
#' \item{\code{Design_FCS_Count}}{total count of FCS from the design}
#' \item{\code{MifScore}}{MIFlow Score}
#' \item{\code{PResearcher}}{Principal researcher}
#' \item{\code{PInvestigator}}{Principal investigator}
#' \item{\code{UploadAuth}}{Author of the upload}
#' \item{\code{ExpDates}}{experiment start - end}
#' \item{\code{ExpStart}}{experiment start}
#' \item{\code{ExpEnd}}{experiment end}
#' \item{\code{UploadDate}}{Date of upload}
#' \item{\code{LastUpdate}}{LastUpdate}
#' \item{\code{Organizations}}{Organizations}
#' \item{\code{Funding}}{Funding}
#' \item{\code{QualControl}}{Quality controls applied}
#' \item{\code{QualControlUrl}}{URL to a quality control experiment}
#' \item{\code{hasWSP}}{at least one attachment file is a FlowJo workspace}
#' \item{\code{Attachments}}{list of attachment file names}
#' \item{\code{Event_total_K}}{total count of events in kilo}
#' \item{\code{Event_mean_K}}{mean count of events per file in kilo}
#' \item{\code{FCS_count}}{total count of FCS from the download page}
#' \item{\code{FCS_total_MB}}{total FCS size in mega bytes}
#' \item{\code{FCS_mean_MB}}{average FCS size in mega bytes}
#' \item{\code{FCSVers}}{versions of FCS}
#' \item{\code{Cytometer}}{cytometers of the FCS}
#' \item{\code{Panel}}{panel}
#' \item{\code{FCS_count_panel}}{count of FCS per panel}}
NULL

#' @rdname fr_datasets
"fr_datasets"

#' @rdname fr_datasets
"fr_datasets_agg_panel"



#' Public experiment representations table
#'
#' Public experience table export from FlowRepository on \code{2024/08/01}.
#'
#' @format data.frame
#' \describe{
#' \item{\code{Experiment.Name}}{Experiment comprehensive name}
#' \item{\code{Repository.ID}}{Flowrepository id}
#' \item{\code{Manuscript.s.}}{PMID vector}
#' \item{\code{Journal.s.}}{NAs, Published Journal name encoded with illustrations}
#' \item{\code{FCS.Files}}{Number of fcs}
#' \item{\code{Illustrations}}{Number of illustrations}
#' \item{\code{Primary.Researcher}}{Contact name}
#' \item{\code{Project}}{Project}
#' \item{\code{MIFlowCyt.Score}}{Nas, Percentage score}
#' \item{\code{Updated}}{Update date Month/Year}}
"fr_tbl"


#' FlowRepository Table Version
#'
#' A character string representing the version of the table extracted from the FlowRepository. The format follows a year/month/day convention.
#'
#' @format Character. A string in the format "YYMMDD"
"fr_tbl_version"
