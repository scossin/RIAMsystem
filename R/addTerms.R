#' @title Load a CSV file of a terminology
#' @description Load in Java a text file containing all the terms of a terminology
#' @param termDetector :a TermDetector instance
#' @param file :the name of the file which the data are to be read from (absolute or relative)
#' @param sep :the field separator character
#' @param colLabel : the ith column contaning the labels. Java uses zero-based indexing, first column is 0.
#' @param colCode : the ith column contaning the codes. Java uses zero-based indexing, first column is 0.
#' @return Nothing, it just load the file
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' @export
loadTerminoCSV <- function(termDetector, file, sep, colLabel, colCode){
  checkTermDetector(termDetector)
  if (length(file) != 1L && !is.character(file))
    stop("'file' must be a single character string")
  filename <- tools::file_path_as_absolute(file)
  if (length(sep) != 1L && !is.character(sep))
    stop("'sep' must be a single character string")
  if (length(colLabel) != 1L && !is.numeric(colLabel))
    stop("'colLabel' must be a single numeric value")
  if (length(colCode) != 1L && !is.numeric(colCode))
    stop("'colCode' must be a single numeric value")
  termDetector$loadTokenTree(filename = filename,
                             sep = sep,
                             colLabel=as.integer(colLabel),
                             colCode=as.integer(colCode))
  return(invisible(NULL))
}


#' @title Add terms to a TermDetector instance
#' @description Add terms and codes to a TermDetector instance to detect these in textual content. Use loadTerminoCSV() to load a whole terminology file.
#' @param termDetector :a TermDetector instance
#' @param terms :a character vector
#' @param codes :a character vector of the same length as terms. Default to NULL ("NA")
#' @return NULL
#' @examples
#' termDetector <- RIAMsystem::newTermDetector()
#' @export
addTerms <- function(termDetector, terms, codes = NULL){
  ## check termDetector
  checkTermDetector(termDetector)

  ## check terms
  if (is.factor(terms)){
    terms <- as.character(terms)
  }
  checkVector(terms, "terms must be a vector")
  checkCharacter(terms, "terms must be a vector of character")

  ## check codes
  if (is.null(codes)){
    codes <- rep("NA",length(terms))
  } else {
    if (is.factor(codes)){
      codes <- as.character(codes)
    }
    checkVector(terms, "terms must be a vector")
    checkCharacter(codes, "codes must be a vector of character")

    bool <- length(codes) == length(terms)
    if (!bool){
      stop("codes vector and terms vector must have the same length")
    }
  }
  df <- data.frame(term = terms, code = codes)
  apply(df, 1, function(x){
    termDetector$addTerm(term = x[1], code=x[2])
    return(NULL)
  })
  return(invisible(NULL))
}
