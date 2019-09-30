#!/bin/bash

# Stages to process
init=1
vtk=1
convert=1
boundary=1
projection=1
rotation=1
segmentation=1
fit_boundary=1
fit_surface=1
export_iges=1

# Global options
cfm=meshes
fault=$2
output=$fault
process_list=${output}/meshes/surface_*.msh
showfig=0

# Conversion (see tsurfmsh -help for documentation)
min_elements=10

# Boundary fitting options (see sffbnd -help for documentation)
degree=2
breg=3.0
est_knots=1
num_knots=10

# Surface fitting options (see sffsrf -help for documentation)
deg_u=2
deg_v=2
pad=0.1
est_uv=1
scale=1.0
fit=0
sreg=1e-4
num_u=10
num_v=10

