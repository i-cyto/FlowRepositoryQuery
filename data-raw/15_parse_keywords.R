## code to prepare `15_parse_keywords` dataset goes here

load("~/FlowRepositoryQuery/data-raw/15_parse_keywords.RData")

# rm previous rda folder
fRDAs <- "~/FlowRepositoryQuery/data/"
# get all files in the directories, recursively
f <- list.files(fRDAs, include.dirs = F, full.names = T, recursive = T)
# remove the files
file.remove(f)

save(dictionary_agg_panel, file = paste0(fRDAs, "dictionary_agg_panel.rda"))
save(fr_datasets, file = paste0(fRDAs, "fr_datasets.rda"))
save(fr_datasets_agg_panel, file = paste0(fRDAs, "fr_datasets_agg_panel.rda"))
save(fr_panels, file = paste0(fRDAs, "fr_panels.rda"))
save(fr_tbl, file = paste0(fRDAs, "fr_tbl.rda"))
save(fr_tbl, file = paste0(fRDAs, "fr_tbl.rda"))
fr_tbl_version = gsub(".*-(.*)-.*", "\\1", fr_html_tbl)
save(fr_tbl_version, file = paste0(fRDAs, "fr_tbl_versionl.rda"))

tools::checkRdaFiles(fRDAs)
tools::resaveRdaFiles(fRDAs,
  compress = c("auto", "gzip", "bzip2", "xz"),
  compression_level, version = NULL
)
