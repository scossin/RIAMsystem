#' @title Add stopwords
#' @description Add stopwords to the detector to remove them from terms and ignore them in the detection phase
#' @param termDetector : a TermDetector instance
#' @param stopwords : a vector of character
#' @return Nothing, it just add the stopwords
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' stopwords <- c("a","de","le","pour")
#' RIAMsystem::addStopwords(termDetector, stopwords)
#' @export
addStopwords <- function(termDetector, stopwords){
  checkTermDetector(termDetector)
  if (is.factor(stopwords)){
    stopwords <- as.character(stopwords)
  }
  if (!(is.vector(stopwords) && is.character(stopwords)))
    stop("'stopwords' must be a vector of character")
  sapply(stopwords, function(x){
    termDetector$addStopwords(x)
  })
  return(invisible(NULL))
}
