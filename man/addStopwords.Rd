% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stopwords.R
\name{addStopwords}
\alias{addStopwords}
\title{Add stopwords}
\usage{
addStopwords(termDetector, stopwords)
}
\arguments{
\item{termDetector}{: a TermDetector instance}

\item{stopwords}{: a vector of character}
}
\value{
Nothing, it just add the stopwords
}
\description{
Add stopwords to the detector to remove them from terms and ignore them in the detection phase
}
\examples{
termDetector <- RIAMsystem::newTermDetector()
stopwords <- c("a","de","le","pour")
RIAMsystem::addStopwords(termDetector, stopwords)
}
