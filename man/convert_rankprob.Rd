% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_rankprob.R
\name{convert_rankprob}
\alias{convert_rankprob}
\title{Convert a multinomial regression to a \code{rankprob} object}
\usage{
convert_rankprob(fit)
}
\arguments{
\item{fit}{the output of a multinomial or ordinal regression model, e.g., form \code{nnet::multinom()}, \code{mclogit::mblogit()}, \code{MASS::polr()}, \code{WeightIt::multinom_weightit()}, or \code{WeightIt::ordinal_weightit()}.}
}
\value{
A \code{rankprobs} object, which also has the original model classes; this simply has the new class and \code{"rank_probs_prob_type"} attribute added. Otherwise the supplied object is unchanged.
}
\description{
\code{convert_rankprob()} converts a supplied multinomial or ordinal regression model to a model that supports computation of probabilities of ranked choices.
}
\details{
\code{convert_rankprobs()} first checks to make sure the model is ordinal or multinomial as determined by \code{\link[insight:model_info]{insight::model_info()}}. Next, it adds \code{"rankprob"} to \code{options("marginaleffects_model_classes")} to facilitate use with \code{marginaleffects} and packages that depend on it, such as \code{clarify}. Finally, it assigned to the supplied object the class \code{"rankprob"}.

To use \code{rankprob}, the supplied model must have a \code{predict()} method with a \code{type} that corresponds to predicted probabilities. This \code{type} is stored in the \code{"rank_probs_prob_type"} attribute of the converted \code{rankprob} object. You can manually set this attribute if \code{convert_rankprob()} guesses it incorrectly. Typically this value is set to \code{"probs"} or \code{"response"} depending on the object.
}
\note{
When using \code{marginaleffects} functions, \code{type = "rank_probs"} must be specified for the functions to work correctly. You may see a warning beginning with something like "These arguments are not known to be supported for models of class \code{rankprob}: rankings." This can be ignored.
}
\examples{
## See exampels at `help("predict.rankprob")`
}
\seealso{
\code{\link[=predict.rankprob]{predict.rankprob()}}
}
