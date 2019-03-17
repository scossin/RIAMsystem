#' @title Add abbreviations
#' @description Add abbreviation at the token level to help the detector
#' @param termDetector :a TermDetector instance
#' @param token : the token (ex : "ac" in "acide acetique")
#' @param abbreviation :the abbreviation (ex: "acide" for the tokne "ac")
#' @return Nothing, it just add the abbreviation
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' @export
addAbbreviations <- function(termDetector, token, abbreviation){
  checkTermDetector(termDetector)
  if (length(token) != 1L && !is.character(token))
    stop("'token' must be a single character string")
  if (length(abbreviation) != 1L && !is.character(abbreviation))
    stop("'abbreviation' must be a single character string")
  termDetector$addAbbreviations(token = token, abbreviation = abbreviation)
  return(invisible(NULL))
}
