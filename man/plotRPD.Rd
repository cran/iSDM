% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotRPD.r
\name{plotRPD}
\alias{plotRPD}
\title{R function to plot the realized versus the potential distribution using a RGB colour space}
\usage{
plotRPD(x=x,y=y,cex,xlab=xlab,ylab=ylab)
}
\arguments{
\item{x}{Either a SpatialPixelsDataFrame, or a SpatialGridDataFrame as defined in package sp or a RasterLayer as defined in package raster}

\item{y}{An object belonging to the same class as x}

\item{cex}{A numerical value giving the amount by which plotting symbols should be magnified relative to the default}

\item{xlab}{A title for the x axis}

\item{ylab}{A title for the y axis}
}
\description{
R function to plot the realized versus the potential distribution using a RGB colour space
}
\examples{
\dontrun{
library(raster)
library(sp)
library(virtualspecies)
library(colorRamps)

envData<-getData('worldclim', var='bio', res=10)
envData<-crop(envData,extent(-8,15,38,55))

# Generate virtual species responses with formatfunctions
my.parameters <- formatFunctions(bio1 = c(fun = "dnorm", mean = 140, sd = 40), 
bio5 = c(fun = "dnorm",mean = 230, sd = 70),
bio6 = c(fun = "dnorm",mean = 10, sd = 40))
# Generate a virtual species potential distributions with responses to environmental variables
potential.dist <- generateSpFromFun(envData[[c(1,5,6)]], my.parameters)$suitab.raster

#Limit the distribution 
realized.dist<-potential.dist
cell.id<-which(coordinates(realized.dist)[,2]>48)
dis.lim<-sample(seq(0,1,by=0.01),length(cell.id),replace=TRUE)
values(realized.dist)[cell.id]<-ifelse(values(realized.dist)[cell.id]>dis.lim,
values(realized.dist)[cell.id]-dis.lim,0)
plotRPD(x=potential.dist,y=realized.dist,cex=0.8,xlab="Potential distribution"
,ylab="Realized distribution")
}
}
\references{
Tarek Hattab, Carol Ximena Garzon Lopez, Michael Ewald, Sandra Skowronek, Raf Aerts, Helene Horen, Boris Brasseur, Emilie Gallet-Moron, Fabien Spicher, Guillaume Decocq, Hannes Feilhauer, Olivier Honnay, Pieter Kempeneers, Sebastian Schmidtlein, Ben Somers, Ruben Van De Kerchove, Duccio Rocchini and Jonathan Lenoir (2017). A unified framework to model the potential and realized distributions of invasive species within the invaded range. Diversity and Distributions. DOI: 10.1111/ddi.12566
}
