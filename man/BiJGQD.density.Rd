\name{BiJGQD.density}
\alias{BiJGQD.density}
\title{
Generate the Transition Density of a Bivariate Jump Generalized Quadratic Diffusion Model (2D JGQD).
}
\description{
\code{BiJGQD.density} generates approximate transitional densities for bivariate generalized quadratic diffusions (GQDs). Given a starting coordinate, (\code{Xs}, \code{Ys}), the approximation is evaluated over a lattice \code{Xt} x \code{Yt} for an equispaced discretization (intervals of width \code{delt}) of the transition time horizon [\code{s}, \code{t}] .
}
\usage{
BiJGQD.density(Xs, Ys, Xt, Yt, s, t, delt, Dtype)
}
\arguments{
  \item{Xt}{x-Coordinates of the lattice at which to evaluate the transition density.}
  \item{Yt}{y-Coordinates of the lattice at which to evaluate the transition density.}
  \item{Xs}{Initial x-coordinate.}
  \item{Ys}{Initial y-coordinate.}
  \item{s}{Starting time of the diffusion.}
  \item{t}{Final time at which to evaluate the transition density.}
  \item{delt}{Step size for numerical solution of the cumulant system. Also used for the discretization of the transition time-horizon. See warnings \bold{[1]} and \bold{[2]}.}
  \item{Dtype}{The density approximant to use. Valid types are \code{"Saddlepoint"} (default) or \code{"Edgeworth"}.}
}
\details{
\if{html}{\figure{TransDens2.png}{GQD}}

\code{BiJGQD.density} constructs an approximate transition density for a class of quadratic diffusion models. This is done by first evaluating the trajectory of the cumulants/moments of the diffusion numerically as the solution of a system of ordinary differential equations over a time horizon \code{[s,t]} split into equi-distant points \code{delt} units apart. Subsequently, the resulting cumulants/moments are carried into a density approximant (by default, a saddlepoint approximation) in order to evaluate the transtion surface.
}
\value{
  \item{density}{3D Array containing approximate density values. Note that the 3rd dimension represents time.}
  \item{Xt}{Copy of x-coordinates.}
  \item{Yt}{Copy of y-coordinates.}
  \item{time}{A vector containing the time mesh at which the density was evaluated.}
  \item{cumulants}{A matrix giving the cumulants of the diffusion. Cumulants are indicated by row-names.}
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
The system of ODEs that dictate the evolution of the cumulants do so approximately. Thus, although it is unlikely such cases will be encountered in inferential contexts, it is worth checking (by simulation) whether cumulants accurately replicate those of the target GQD. Furthermore, it may in some cases occur that the cumulants are indeed accurate whilst the density approximation fails. This can again be verified by simulation.

\bold{Warning [2]}:
The parameter \code{delt} is also used as the stepsize for solving a system of ordinary differential equations (ODEs) that govern the evolution of the cumulants of the diffusion. As such \code{delt} is required to be small for highly non-linear models in order to ensure sufficient accuracy.
}

\seealso{
See \code{\link{BiJGQD.mcmc}} and \code{\link{JGQD.density}}.
}



\examples{
\donttest{
#
 rm(list=ls(all=T))
 a00 = function(t){0.25*5}
 a10 = function(t){-0.25}
 a01 = function(t){0.0}
 c10 = function(t){0.25*0.25}

 b00 = function(t){0.25*5}
 b01 = function(t){-0.25}
 b10 = function(t){0}
 f01 = function(t){0.25*0.25}

 lam1= function(t){2}
 lam2= function(t){2}

 Nmu11 = function(t){0.0}  # m
 Nsig11 = function(t){0.5} # m
 Nmu21 = function(t){0.0}  # n
 Nsig21 = function(t){0.0} # n
 Nmu12 = function(t){0.0}  # o
 Nsig12 = function(t){0.0} # o
 Nmu22 = function(t){0.0}  # p
 Nsig22 = function(t){0.5} # p

  xx=seq(2,15,1/10)
  res= BiJGQD.density(8,8,xx,xx,0,5,1/100,Dtype='Saddlepoint')

mux     = function(x,y,t){a00(t)+a10(t)*x+a01(t)*y}
sigmax  = function(x,y,t){sqrt(c10(t)*x)}
muy     = function(x,y,t){b00(t)+b10(t)*x+b01(t)*y}
sigmay  = function(x,y,t){sqrt(f01(t)*y)}
lambda1 = function(x,y,l){lam1(0)}
lambda2 = function(x,y,l){lam2(0)}

j11     = function(x,y,z){z}
j12     = function(x,y,z){z}
j21     = function(x,y,z){z}
j22     = function(x,y,z){z}


simulate=function(x0=8,y0=8,N=1000)
{
  d=0
  delta=1/100
  tt=seq(0,5,delta)
  X=rep(x0,N)
  Y=rep(y0,N)

  kkk=1
  MM= matrix(0,14,length(tt))

  xtrak = rep(x0,length(tt))
  ytrak = rep(x0,length(tt))

  jtrakx = rep(0,length(tt))
  jtraky = rep(0,length(tt))

  for(i in 2:length(tt))
  {
    X=X+mux(X,Y,d)*delta+sigmax(X,Y,d)*rnorm(N,sd=sqrt(delta))
    Y=Y+muy(X,Y,d)*delta+sigmay(X,Y,d)*rnorm(N,sd=sqrt(delta))

    d=d+delta

    xpre=X[1]
    ypre=Y[1]
    events1 = (lambda1(X,Y,0)*delta>runif(N))
    if(any(events1))
    {
      wh=which(events1)
      X[wh]=X[wh]+j11(X[wh],Y[wh],rnorm(length(wh),Nmu11(d),Nsig11(d)))
      Y[wh]=Y[wh]+j21(X[wh],Y[wh],rnorm(length(wh),Nmu21(d),Nsig21(d)))
    }
    events2 = (lambda2(X,Y,0)*delta>runif(N))
    if(any(events2))
    {
      wh=which(events2)
      X[wh]=X[wh]+j12(X[wh],Y[wh],rnorm(length(wh),Nmu12(d),Nsig12(d)))
      Y[wh]=Y[wh]+j22(X[wh],Y[wh],rnorm(length(wh),Nmu22(d),Nsig22(d)))
    }

    jtrakx[i] = X[1]-xpre
    xtrak[i]  = X[1]
    jtraky[i] = Y[1]-ypre
    ytrak[i]  = Y[1]

    MM[1,i] =sum(X)/N
    MM[2,i] =sum(X^2)/N
    MM[3,i] =sum(X^3)/N
    MM[4,i] =sum(X^4)/N
    MM[5,i] =sum(Y)/N
    MM[6,i] =sum(Y^2)/N
    MM[7,i] =sum(Y^3)/N
    MM[8,i] =sum(Y^4)/N
    MM[9,i] =sum(X^1*Y^1)/N
    MM[10,i]=sum(X^1*Y^2)/N
    MM[11,i]=sum(X^2*Y^1)/N
    MM[12,i]=sum(X^2*Y^2)/N
    MM[13,i]=sum(X^3*Y^1)/N
    MM[14,i]=sum(X^1*Y^3)/N

  filled.contour(res$Xt,res$Yt,res$density[,,i],
  main=paste0('Transition Density \n (t = ',res$time[i],')'),
  color.palette=colorRampPalette(c('white','green','blue','red'))
  ,xlab='Prey',ylab='Preditor',plot.axes=
   {
     # Add simulated trajectories
     points(Y~X,pch=20,col='grey47',cex=0.01)

     points(res$moments[5,i]~res$moments[1,i],bg='white',pch=21,cex=1.5)
     axis(1);axis(2);
     points(mean(Y)~mean(X),pch=20,col='pink',cex=1)
     # Add a legend
     legend('topright',lty=c('solid',NA,NA),col=c('grey57','grey47','black'),
             pch=c(NA,20,21),legend=c('Simulated Expectation','Simulated Trajectories'
             ,'Predicted Expectation'))
   })
  }
  return(list(MM=MM,tt=tt,X=X,Y=Y,xtrak=xtrak,ytrak=ytrak,jtrakx=jtrakx,jtraky=jtraky))
}

x11()
par(ask=F)
res=simulate()


#===============================================================================
}
}

