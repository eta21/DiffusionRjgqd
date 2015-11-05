\name{JGQD.estimates}
\alias{JGQD.estimates}
\title{
Extract Parmaeter Estimates from \code{.mle()} or \code{.mcmc()} Objects.
}
\description{
\code{JGQD.estimates()} calculates parameter estimates from \code{.mle()} or \code{.mcmc()} model objects.
}
\usage{
JGQD.estimates(x, thin = 100, burns)
}

\arguments{
  \item{x}{List object of type 'JGQD.mcmc' or 'JGQD.mle'. That is, when \code{model =JGQD.mcmc()} then \code{model} constitutes an appropriate object for \code{x}.
}
  \item{thin}{
Thinnging level for parameter chain.
}
  \item{burns}{
Number of MCMC updates to discard before calculating estimates.
}
}

\value{
Data frame with parameter estimates and appropriate interval statistics.
}

\author{
Etienne A.D. Pienaar: \email{etiannead@gmail.com}
}
\references{
Updates available on GitHub at \url{https://github.com/eta21}. Visit \url{http://etiennead.wix.com/diffusionr} for more details on the DiffusionRjgqd package.
}
\examples{
\donttest{
#===============================================================================

#===============================================================================

}
}


\seealso{
\code{\link{JGQD.mcmc}},  \code{\link{BiJGQD.mcmc}}.
}

