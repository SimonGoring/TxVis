
#' Generate an alluvial plot for treatment data.
#' 
#' Using a txVis object, plot the sequencing of treatments using an alluvial plot.
#' 
#' @import alluvial
#' @param txVis An object of class \code{txVis}.
#' 
#' @export


tx_alluvial <- function(txVis,nsequ) {
  ##note: you need this:#library(devtools) 
                        #install_github("mbojan/alluvial")
                        #library(alluvial)
  
  nseq<- ifelse (!is.null(nsequ), nsequ, 4)  #defaults to 4 if not entered by user
  seq.cols <- paste0( rep("seq_", nseq) , c(1:nseq) )
  seq.fun  <- paste0(seq.cols, collapse = " + ")
  
  input_agged_seq <- aggregate(data = reform_seq(txVis,nseq), 
                               as.formula(paste0("pt_id ~ ", seq.fun)) ,
                               FUN = length)     
  
  
  #input_agged_seq <- aggregate(data = treats_seq, pt_id ~ seq_1 + seq_2 + seq_3 + seq_4, FUN=length)     #flexible code to permit more seq - not just a series of case/if statements?
  colnames(input_agged_seq)[ncol(input_agged_seq)] <- "freq"

  # run alluvial plot
  alluvial(input_agged_seq[,1:nseq], freq = input_agged_seq$freq)
  
}

