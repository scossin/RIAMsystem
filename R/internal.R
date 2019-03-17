#' Check an object is a vector or return an error
#' @param x : the object to test
#' @noRd
checkVector <- function(x, errorMessage){
  bool <- is.vector(x)
  if (!bool){
    stop(errorMessage)
  }
  return()
}

#' Check an object is character type or return an error
#' @param x : the object to test
#' @noRd
checkCharacter <- function(x, erroMessage){
  bool <- is.character(x)
  if (!bool){
    stop(erroMessage)
  }
  return()
}

#' Check the object is a Java instance of the TermDector Class
#' @param termDetector : the object to test
#' @noRd
checkTermDetector <- function(termDetector){
  if (!inherits(x = termDetector, what = "jobjRef")){
    stop("termDetector must be a Java object. Create it with newTermDetector() function")
  }
  if (termDetector$getClass()$toString() != "class fr.erias.riamsystem.TermDetector"){
    stop("termDetector must be an instance of fr.erias.riamsystem.TermDetector. Create it with newTermDetector() function")
  }
  return()
}

#' Check the object is a Java instance of the CTcode Class
#' @param ctcode : the object to test
#' @noRd
checkCTcode <- function(ctcode){
  if (!inherits(x = ctcode, what = "jobjRef")){
    stop("ctcode must be a Java object.")
  }
  if (ctcode$getClass()$toString() != "class fr.erias.IAMsystem.ct.CTcode"){
    stop("ctcode must be an instance of fr.erias.riamsystem.TermDetector. Create it with newTermDetector() function")
  }
}

#' Extract information from a ctcode object
#' @param ctcode : the ctcode object to test
#' @noRd
extractCTcodeInfo <- function(ctcode){
  candidateTermString <- ctcode$getCandidateTermString()
  candidateTerm <- ctcode$getCandidateTerm()
  startPosition <- ctcode$getStartPosition()
  endPosition <- ctcode$getEndPosition()
  code <- ctcode$getCode()
  normalizedLabel <- ctcode$getLabel()
  return(data.frame(
    candidateTermString = candidateTermString,
    candidateTerm = candidateTerm,
    startPosition = startPosition,
    endPosition = endPosition,
    code = code,
    normalizedLabel = normalizedLabel,stringsAsFactors = F
  ))
}
