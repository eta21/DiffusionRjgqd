\name{JGQD.plot}
\alias{JGQD.plot}
\title{
Quick Plots for DiffusionRjgqd Objects
}
\description{
\code{JGQD.plot()} recognizes output objects calculated using routines from the \bold{DiffusionRjgqd} package and subsequently constructs an appropriate plot, for example a perspective plot of a transition density.
}
\usage{
JGQD.plot(x, thin = 1, burns, h = FALSE)
}
\arguments{
  \item{x}{
Generic JGQD-objects, i.e. \code{res = JGQD.density()}.
}
  \item{thin}{
Thinning interval for \code{.mcmc} objects.
}
  \item{burns}{
Number of parameter draws to discard for \code{.mcmc} objects.
}
  \item{h}{
  if \code{TRUE} a histogram is drawn i.s.o. a trace plot.
}
}

\value{Varies in accordance with input type.
}
\author{
Etienne A.D. Pienaar: \email{etiannead@gmail.com}
}
\references{
Updates available on GitHub at \url{https://github.com/eta21}. Visit \url{http://etiennead.wix.com/diffusionr} for more details on the DiffusionRjgqd package.
}


\seealso{
\code{\link{JGQD.mcmc}}, \code{\link{JGQD.density}}, \code{\link{BiJGQD.density}} etc.
}
\examples{
  \donttest{
#==================================================================================================
  }
}
\keyword{Plot}

