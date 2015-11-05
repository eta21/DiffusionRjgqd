\name{JGQD.density}
\alias{JGQD.density}
\title{
Generate the Transition Density of a Scalar Jump Generalized Quadratic Diffusion (GQD).
}
\description{
\code{JGQD.density()} approximates the transition density of a scalar generalized quadratic diffusion model (GQD). Given an initial value for the diffusion, \code{Xs}, the approximation is evaluated for all \code{Xt} at equispaced time-nodes given by splitting [\code{s}, \code{t}] into subintervals of length \code{delt}.
 \if{html}{
 \code{JGQD.density()} approximates transitional densities of jump diffusions of the form:

 \figure{JGQDeqn1.png}{JGQD}
 }
 \if{latex}{
 \code{JGQD.density()} supports jump diffusions of the form:
 \deqn{dX_t = \mu_{\theta}(X,t)dt +\sigma_{\theta}(X_t,t)dW_t+dP_t\\}
 with drift
 \deqn{\mu_{\theta}(X,t) = G_0(t,\theta)+G_1(t,\theta)X_t+G_2(t,\theta)X_t^2\\}
 and diffusion
 \deqn{\sigma_{\theta}(X,t)=\sqrt{Q_0(t,\theta)+Q_1(t,\theta)X_t+Q_2(t,\theta)X_t^2}\\}
 where \eqn{dP_t=j_{\theta}(X_t,\dot{z}_t)dN_t} is a Poisson process with intensity
 \deqn{\lambda_{\theta}(X,t)={\lambda_0(t,\theta)+\lambda_1(t,\theta)X_t+\lambda_2(t,\theta)X_t^2},\\}
 jump coefficient:
 \deqn{j_{\theta}(X_t,\dot{z}_t) = \dot{z}_t} or \deqn{j_{\theta}(X_t,\dot{z}_t) = \dot{z}_tX_t\\ }
 and
\deqn{\dot{z}_t\sim\mbox{Normal}(\mu_J(t,\theta),\sigma_J^2(t,\theta)),\\}
\deqn{\dot{z}_t\sim\mbox{Exponential}(\lambda_J(t,\theta)),\\}
\deqn{\dot{z}_t\sim\mbox{Gamma}(\alpha_J(t,\theta),\beta_J(t,\theta)),\\}
or

\deqn{\dot{z}_t\sim\mbox{Laplace}(a_J(t,\theta),b_J(t,\theta)).\\}
 }
 }
\usage{
JGQD.density(Xs = 4, Xt = seq(5, 8, 1/10), s = 0, t = 5, delt =1/100,
             Jdist = "Normal", Jtype = "Add", Dtype = "Saddlepoint",
             Trunc = c(8, 4), factorize = TRUE, beta, Integ = TRUE,
             print.output = TRUE)
}
\arguments{
  \item{Xs}{Initial value of the process at time s.}
  \item{Xt}{Vector of values at which the transition density is to be evaluated over the trajectory of the transition density from time s to t.}
  \item{s}{The starting time of the process.}
  \item{t}{The time horizon up to and including which the transitional density is evaluated.}
  \item{delt}{Size of the time increments at which successive evaluations are made.}
  \item{Dtype}{Character string indicating the type of density approximation (see details) to use. Types: \code{'Saddlepoint'} and \code{'Edgeworth'} are supported (default = \code{'Saddlepoint'}).}
  \item{Trunc}{Vector of length 2 containing the cumulant truncation order and the density truncation order respectively. May take on values 4 and 8 with the constraint that \code{Trunc[1] >= Trunc[2]}. Default is \code{c(4,4)}.}
\item{Jdist}{Valid entries are 'Normal', 'Exponential', 'Gamma' or 'Laplace'.}
\item{Jtype}{Valid types are 'Add' or 'Mult'.}
\item{factorize}{Should factorization be used (default = TRUE).}
\item{beta}{Variable used for special cases.}
\item{Integ}{Variable used for special cases.}
\item{print.output}{if \code{TRUE}, model information is printed to the console.}
}
\details{
\if{html}{\figure{TransDens1.png}{vdfs}}

\code{JGQD.density} constructs an approximate transition density for a class of quadratic diffusion models. This is done by first evaluating the trajectory of the cumulants/moments of the diffusion numerically as the solution of a system of ordinary differential equations over a time horizon \code{[s,t]} split into equi-distant points \code{delt} units apart. Subsequently, the resulting cumulants/moments are carried into a density approximant (by default, a saddlepoint approximation) in order to evaluate the transtion surface.



}

\value{
  \item{density}{A matrix giving the density over the spatio-temporal mesh whose vertices are defined by paired permutations of the elements of \code{X_t} and  \code{time}}
 \item{Xt}{ A vector of points defining the state space at which the density was evaluated(recycled from input).}
  \item{time}{A vector of time points at which the density was evaluated.}
  \item{cumulants}{A matrix giving the cumulants of the diffusion. Row i gives the i-th cumulant.}
  \item{moments}{A matrix giving the moments of the diffusion. Row i gives the i-th cumulant.}
  \item{mesh}{A matrix giving the mesh used for normalization of the density.}
}



\references{
Updates available on GitHub at \url{https://github.com/eta21}. Visit \url{http://etiennead.wix.com/diffusionr} for more details on the DiffusionRjgqd package.

Daniels, H.E. 1954 Saddlepoint approximations in statistics. \emph{Ann. Math. Stat.}, \bold{25}:631--650.

Eddelbuettel, D. and Romain, F. 2011 Rcpp: Seamless R and C++ integration. \emph{Journal of Statistical Software}, \bold{40}(8):1--18,. URL \url{http://www.jstatsoft.org/v40/i08/}.

Eddelbuettel, D. 2013 \emph{Seamless R and C++ Integration with Rcpp}. New York: Springer. ISBN
978-1-4614-6867-7.

Eddelbuettel, D. and Sanderson, C. 2014 Rcpparmadillo: Accelerating R with high-performance C++
linear algebra. \emph{Computational Statistics and Data Analysis}, \bold{71}:1054--1063. URL
\url{http://dx.doi.org/10.1016/j.csda.2013.02.005}.

Feagin, T. 2007 A tenth-order Runge-Kutta method with error estimate. \emph{In Proceedings of the IAENG
Conf. on Scientifc Computing}.

Varughese, M.M. 2013 Parameter estimation for multivariate diffusion systems. \emph{Comput. Stat. Data An.},
\bold{57}:417--428.
}
\author{
Etienne A.D. Pienaar: \email{etiannead@gmail.com}
}



\section{Warning}{
\bold{Warning [1]}:
The system of ODEs that dictate the evolution of the cumulants do so approximately. Thus, although it is unlikely such cases will be encountered in inferential contexts, it is worth checking (by simulation) whether cumulants accurately replicate those of the target jump GQD. Furthermore, it may in some cases occur that the cumulants are indeed accurate whilst the density approximation fails. This can again be verified by simulation after which alternate density approximants may be specified through the variable \code{Dtype}.

\bold{Warning [2]}:
The parameter \code{delt} is also used as the stepsize for solving a system of ordinary differential equations (ODEs) that govern the evolution of the cumulants of the diffusion. As such \code{delt} is required to be small for highly non-linear models in order to ensure sufficient accuracy.
}

\seealso{
See \code{\link{JGQD.mcmc}} and \code{\link{BiJGQD.density}}.
}

\examples{
\donttest{
rm(list=ls(all=T))
#===============================================================================
# Generate the transition density of a CIR process with time dependant
# drift and state-dependant jump intensity.
#-------------------------------------------------------------------------------
G0=function(t){6+2*sin(8*pi*t)}
G1=function(t){-1}
Q1=function(t){0.5}

Jmu    = function(t){1.5}
Jsig   = function(t){0.2}
Lam = function(t){1}
Nu1    = function(t){0.05}

mu     = function(x,t){G0(t)+G1(t)*x}
sigma  = function(x,t){sqrt(Q1(t)*x)}
j      = function(x,z){z}

#' Now simulate the jump diffusion
#+
TT = 0.2
simulate=function(x0=4,N=25000,pts =seq(0.1*TT,TT,length=4))
{
  d=0
  delta=1/1000
  tt=seq(0,TT,delta)
  X=rep(x0,N)

  kkk=1
  MM= matrix(0,4,length(tt))
  MM[,1]=X[1]^{1:4}

  xtrak = rep(x0,length(tt))
  jtrak = rep(0,length(tt))
  etrak = rep(0,length(tt))
  ltrak = rep(0,length(tt))
  L=list()
  kkk =1
  for(i in 2:length(tt))
  {
    X=X+mu(X,d)*delta+sigma(X,d)*rnorm(N,sd=sqrt(delta))
    d=d+delta

    events = ((Lam(d)+Nu1(d)*X)*delta>runif(N))
    xpre=X[1]
    if(any(events))
    {
      wh=which(events)
      X[wh]=X[wh]+j(X[wh],rnorm(length(wh),Jmu(d),Jsig(d)))

    }
    jtrak[i] = X[1]-xpre
    xtrak[i]  = X[1]

    MM[1,i]=sum(X)/N
    MM[2,i]=sum(X^2)/N
    MM[3,i]=sum(X^3)/N
    MM[4,i]=sum(X^4)/N
    if(sum(pts==round(d,3))!=0)
    {
      L[[kkk]] = hist(X,plot=F,breaks=50)
      kkk=kkk+1
    }
  }
  return(list(MM=MM,tt=tt,X=X,xtrak=xtrak,etrak=etrak,jtrak=jtrak,ltrak=ltrak,hists=L,pts=pts))
}
res2=simulate()

res=JGQD.density(4,seq(2,10,1/10),0,TT,1/100)


#' Time dependent histograms
#+
library(rgl)
persp3d(res$Xt,res$time,pmax(pmin(res$density, 1.5),0),col='white',alpha=0.5,box=F,
        xlab='Xt',ylab='Time',zlab='')
cols=colorRampPalette(c("red", "yellow", "green"))
for(i in 2:4)
{
  h1 =res2$hists[[i-1]]
  y=rep(h1$density,each=2)
  x=c(rbind(h1$breaks[-length(h1$breaks)],h1$breaks[-1]))
  hd=cbind(0,y,0)
  tt=res2$pts[i]
  surface3d(x,c(tt-0.0001,tt,tt+0.0001),hd,col=cols(5)[i],alpha=1)
  lines3d(res$Xt,tt,res$density[,res2$pts[i]*100],col='black',lwd=2)
}

#===============================================================================
}
}

\keyword{ transition density }
\keyword{ cumulants }
