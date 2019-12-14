#EPIC
.onLoad <- function(libname, pkgname) {
  utils::data(Mouse_human_mapping, package = pkgname, envir = parent.env(environment()))
  Mouse_human_mapping <- SSMD::Mouse_human_mapping
  assign("Mouse_human_mapping", Mouse_human_mapping, envir = parent.env(environment()))
}

EPIC <- function(bulk_data){
  data_c1=bulk_data
  common_gene <- intersect(rownames(data_c1), Mouse_human_mapping[,2])
  data_c2 <- data_c1[common_gene,]
  human_mouse_mapping2 <- Mouse_human_mapping
  rownames(human_mouse_mapping2) <- human_mouse_mapping2[,2]
  ccc <- human_mouse_mapping2[rownames(data_c2),]
  data_c2=as.matrix(data_c2)
  rownames(data_c2) <- ccc[,1]
  data_c3 <- data_c2[unique(rownames(data_c2)),]
  
  library(EPIC)
  out <- EPIC(data_c3)
  predict_p <- out[[2]]
  predict_p
}