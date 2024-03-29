% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/icc.R
\name{calc_icc}
\alias{calc_icc}
\title{Calculate Inter-Rater ICC}
\usage{
calc_icc(
  .data,
  subject = "subject",
  rater = "rater",
  scores = c("score1", "score2"),
  k = NULL,
  method = ggdist::mode_qi,
  ci = 0.95,
  chains = 4,
  iter = 5000,
  file = NULL,
  ...
)
}
\arguments{
\item{.data}{Either a data frame containing at least the variables identified
in \code{subject}, \code{rater}, and \code{score} or a brmsfit object.}

\item{subject}{A string indicating the column name in \code{.data} that contains
an identifier for the subject or thing being scored in each row (e.g.,
person, image, or document). (default = \code{"subject"})}

\item{rater}{A string indicating the column name in \code{.data} that contains an
identifier for the rater or thing providing the score in each row (e.g.,
rater, judge, or instrument). (default = \code{"rater"})}

\item{scores}{A character vector indicating the column names in \code{.data} that
contain the numerical scores representing the rating of each row's subject
from that same row's rater (e.g., score, rating, judgment, measurement).
(default = \code{c("score1", "score2")})}

\item{k}{Either \code{NULL} to set the number of raters you would like to estimate
the reliability of to the total number of unique raters observed in \code{.data}
or an integer specifying the number of raters you would like to estimate
the reliability of (see details below). (default = \code{NULL})}

\item{method}{A function (ideally from \code{\link[ggdist:point_interval]{ggdist::point_interval()}}) that
returns a data frame containing a point estimate (\code{y}) and the lower
(\code{ymin}) and upper (\code{ymax}) bounds of an interval estimate. (default =
\code{\link[ggdist:point_interval]{ggdist::mode_qi()}})}

\item{ci}{A finite number between 0 and 1 that represents the width of the
credible intervals to estimate (e.g., 0.95 = 95\% CI). (default = \code{0.95})}

\item{chains}{An integer representing the number of Markov chains to use in
estimation. Forwarded on to \code{\link[brms:brm]{brms::brm()}}. (default = \code{4})}

\item{iter}{An integer representing the total number of interations per chain
(including warmup). Forwarded on to \code{\link[brms:brm]{brms::brm()}}. (default = \code{5000})}

\item{file}{Either \code{NULL} to ignore or a string representing the filename to
save the results to. If a file with that name already exists, the results
will instead be read from that file. (default = \code{NULL})}

\item{...}{Further arguments passed to \code{\link[brms:brm]{brms::brm()}}.}
}
\value{
A list object of class "varde_icc" that includes three main elements:
\itemize{
\item \verb{$iccs_summary}: A \code{\link[tibble:tibble]{tibble::tibble()}} containing summary information about
each ICC estimate.
\item \verb{$vars_summary}: A \code{\link[tibble:tibble]{tibble::tibble()}} containing summary information about
each variance estimate.
\item \verb{$ints_summary}: A \code{\link[tibble:tibble]{tibble::tibble()}} containing summary information about
each random intercept estimate.
\item \verb{$iccs_posterior}: A matrix where each row is a single posterior sample and
each column is an ICC estimate.
\item \verb{$vars_posterior}: A matrix where each row is a single posterior sample and
each column is a variance estimate.
\item \verb{$ints_posterior}: A matrix where each row is a single posterior sample and
each column is a random intercept estimate.
\item \verb{$config}: A list containing the specified \code{method}, \code{ci}, and \code{k} values.
\item \verb{$model}: The brmsfit object created by \code{\link[brms:brm]{brms::brm()}} containing the full
results of the Bayesian generalizability study.
}
}
\description{
Calculate variance component and inter-rater intraclass correlation estimates
using a Bayesian generalizability study.
}
