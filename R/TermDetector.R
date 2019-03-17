#' @title An object to detect terminology entries in textual content
#' @description Create a new Java instance of the TermDetector class. Adds stopwords, terms and abbreviations after initialization
#' @return a new Java instance of the TermDetector class.
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' @export
newTermDetector <- function() {
  rJava::.jinit() ## this is benign in that it's equivalent to .jaddClassPath if a JVM is running
  rJava::.jaddClassPath(system.file("java", "RIAMsystem0-1-1.jar", package="RIAMsystem"))
  termDetector <- rJava::.jnew(class = "fr.erias.riamsystem.TermDetector")
  return(termDetector)
}

#' @title Detect terms in textual content
#' @description Detect all the terms in textual content. Load the terms in the detector first with addTerms or loadTerminoCSV. It returns a data.frame with terms detected.
#' @param termDetector :a TermDetector instance
#' @param text :a character vector of length 1
#' @return A dataframe containing:
# * @param candidateTermString The candidate term string as it is in the sentence
# * @param startPosition The start position of this candidate term in the sentence
# * @param endPosition The end position of this candidate term in the sentence
# * @param code the candidateTerm comes from a terminology, it must have a code or uri
# * @param label the candidateTerm comes from a terminology, it must have a label
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' @export
detect <- function(termDetector, text){
  checkTermDetector(termDetector)
  ctcodes <- termDetector$detect(text)
  iter <- ctcodes$iterator()
  output <- data.frame(
    candidateTermString = character(),
    candidateTerm = character(),
    startPosition = integer(),
    endPosition = integer(),
    code = character(),
    normalizedLabel = character()
  )
  while(iter$hasNext()){
    ctcode <- iter$'next'()
    info <- extractCTcodeInfo(ctcode)
    output <- rbind(output, info)
  }
  return(output)
}
