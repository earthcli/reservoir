% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dp_hydro.R
\name{dp_hydro}
\alias{dp_hydro}
\title{Dynamic Programming for hydropower reservoirs}
\usage{
dp_hydro(Q, capacity, capacity_live = capacity, surface_area, evap,
  installed_cap, head, qmax, max_depth, efficiency = 0.9, S_disc = 1000,
  R_disc = 10, S_initial = 1, r2g, plot = TRUE)
}
\arguments{
\item{Q}{time series object. Net inflows to the reservoir. Must be in volumetric units of Mm^3.}

\item{capacity}{numerical. The total reservoir storage capacity (including unusable "dead" storage). Must be in Mm^3.}

\item{capacity_live}{numerical. The volume of usable water in the reservoir ("live capacity" or "active storage"). capacity_live <= capacity. Default capacity_live = capacity. Must be in Mm^3.}

\item{surface_area}{numerical. The reservoir surface area at full capacity. Must be in square kilometers (km^2), or Mm^2.}

\item{evap}{vector or time series object of length Q, or a numerical constant, representing evaporation loss potential from reservoir surface. Varies with level if depth and surface_area parameters are specified. Must be in meters, or kg/m2 * 10 ^ -3.}

\item{installed_cap}{numerical. The hydropower plant electric capacity (MW).}

\item{head}{numerical. The maximum hydraulic head of the hydropower plant (m). Can be omitted and estimated if qmax is supplied.}

\item{qmax}{numerical. The maximum flow into the hydropower plant. Can be omitted and estimated if head is supplied. Must be in volumetric units of Mm^3.}

\item{max_depth}{numerical. The maximum water depth of the reservoir at maximum capacity. If omitted, the depth-storage-area relationship will be estimated from surface area and capacity only. Recommended units: meters.}

\item{efficiency}{numerical. The hydropower plant efficiency. Default is 0.9, but, unless user specifies an efficiency, it will be automatically re-estimated if head and qmax are supplied.}

\item{S_disc}{integer. Storage discretization--the number of equally-sized storage states. Default = 1000.}

\item{R_disc}{integer. Release discretization. Default = 10 divisions.}

\item{S_initial}{numeric. The initial storage as a ratio of capacity (0 <= S_initial <= 1). The default value is 1.}

\item{r2g}{vector. Optional end-state cost-to-go.}

\item{plot}{logical. If TRUE (the default) the storage behavior diagram and release time series are plotted.}
}
\value{
Returns the time series of optimal releases and simulated storage, evaporation, depth, uncontrolled spill, and power generated. Total energy generated is also returned.
}
\description{
Determines the optimal sequence of turbined releases to maximise the total energy produced by the reservoir.
}
\examples{
layout(1:4)
dp_hydro(resX$Q_Mm3, resX$cap_Mm3, surface_area = resX$A_km2,
installed_cap = resX$Inst_cap_MW, qmax = mean(resX$Q_Mm3), S_disc = 100)
}
\seealso{
\code{\link{sdp_hydro}} for Stochastic Dynamic Programming for hydropower reservoirs.
}

