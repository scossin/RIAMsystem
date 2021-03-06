% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TermDetector.R
\name{newTermDetector}
\alias{newTermDetector}
\title{An object to detect terminology entries in textual content}
\usage{
newTermDetector()
}
\value{
a new Java instance of the TermDetector class.
}
\description{
Create a new Java instance of the TermDetector class. Adds stopwords, terms and abbreviations after initialization
}
\examples{
termDetector <- RIAMsystem::newTermDetector()
}
