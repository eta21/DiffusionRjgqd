
# DiffusionRjgqd
Inference and Analysis for Generalized Quadratic Jump Diffusions

<<<<<<< HEAD
## What is DiffusionRjgqd?
__DiffusionRjgqd__ is collection of tools for performing inference and analysis on scalar and bivariate time-inhomogeneous jump diffusion processes with quadratic drift and diffusion terms in R. 
=======
<<<<<<< HEAD
## What is DiffusionRjgqd?
__DiffusionRjgqd__ is collection of tools for performing inference and analysis on scalar and bivariate time-inhomogeneous jump diffusion processes with quadratic drift and diffusion terms in R. 

## Why use DiffusionRjgqd?
__DiffusionRjgqd__ provides a simple interface that requires minimal mathematical input in order to perform analysis on non-linear, time-inhomogeneous diffusion processes. The package also makes use of C++ in order to maximize the computational efficiency of inference routines. As such it is possible to conduct inference on a plethora of models in a desktop environment without incurring excessively long computation times.

## Get DiffusionRjgqd?
Check out [DiffusionRjgqd](https://github.com/eta21/DiffusionRjgqd) on GitHub for the package source files and [DiffusionR gqd-Downloads](https://github.com/eta21/DiffusionRjgqd-Downloads) for example scripts and other downloadable content.
=======
## What is DiffusionRgqd?
__DiffusionRjgqd__ is collection of tools for performing inference and analysis on scalar and bivariate time-inhomogeneous diffusion processes with quadratic drift and diffusion terms in R.
>>>>>>> bd8981f278fdc654275afac7d2a1801052e6f3a8

## Why use DiffusionRgqd?
__DiffusionRjgqd__ provides a simple interface that requires minimal mathematical input in order to perform analysis on non-linear, time-inhomogeneous diffusion processes. The package also makes use of C++ in order to maximize the computational efficiency of inference routines. As such it is possible to conduct inference on a plethora of models in a desktop environment without incurring excessively long computation times.

## Get DiffusionRjgqd?
<<<<<<< HEAD
Check out [DiffusionRjgqd](https://github.com/eta21/DiffusionRjgqd) on GitHub for the package source files and [DiffusionR gqd-Downloads](https://github.com/eta21/DiffusionRjgqd-Downloads) for example scripts and other downloadable content.
=======
Check out [DiffusionRgqd](https://github.com/eta21/DiffusionRjgqd) on GitHub for the package source files and [DiffusionRgqd-Downloads](https://github.com/eta21/DiffusionRjgqd-Downloads) for example scripts and other downloadable content.
>>>>>>> e0fcc42f9eaa8070e2b80a174a29e24982c24de4
>>>>>>> bd8981f278fdc654275afac7d2a1801052e6f3a8


# Installation Notes
Mac users may have to carry out some additional installation procedures in order for __DiffusionRjgqd__ to operate optimally. 

## Mac users:
To install the latest version of __Rcpp__, the latest version of R is needed.
To install __RcppArmadillo__, the __Fortran__ version used by R needs to be updated.
To install __rgl__, the computer needs to have X11 installed.
Update R to the latest version.
Run the following code:
install.packages("Rcpp", type = "source",dep=T) 

#### Open a Terminal and run the following code:

curl -O http://r.research.att.com/libs/gfortran-4.8.2-darwin13.tar.bz2 
sudo tar fvxz gfortran-4.8.2-darwin13.tar.bz2 -C / 

#### Back in R, run the following code:
install.packages("RcppArmadillo",dep=T) 

#### Make sure you have X11 installed. 
Go to Applications/Utilities and see if X11 is there. If not, you’ll need to install X11 or XQuartz. These are available from http://xquartz.macosforge.org/landing/

#### Back in R, run the following code:
install.packages(“rgl",dep=T) 

#### Download the DiffusionRjgqd package and run the code:
install.packages("~/DiffusionRgqd_1.0.tar.gz", repos = NULL, type = "source”)

#### Run the following code in R to see if the package works:
library(DiffpackRgqd) 
example(GQD.density)
example(GQD.mcmc)
