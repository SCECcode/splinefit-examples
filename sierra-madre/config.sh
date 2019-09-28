#!/usr/bin/bash

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

# Boundary fitting options
degree=2
boundary_regularization=3.0

# Surface fitting options
degree_u=2
degree_v=2
padding=0.1
cell_scaling=1.0

