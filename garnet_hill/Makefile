# This example meshes the Garnet Hill fault
project=garnet_hill
# Doesn't work because of duplicate point cloud data
fault1=SAFS-SAFZ-MULT-Garnet_Hill_fault_strand-CFM4_m500

fault2=Garnet_Hill_Group1_2

# Causes boundary data extrapolation to fail for some points 
fault3=Garnet_Hill_Group1_3

fault4=Garnet_Hill_Group2_2
fault5=Garnet_Hill_Group2_3
fault6=Garnet_Hill_Group1

ext=brep
union=1
# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=500
clmax=500
order=1
algo=meshadapt
smooth=3

################################################################################

all: group

download:
	bash download.sh

build: group

garnet_hill_mult:
	sfbuild config.sh $(fault1)

group:
	sfbuild config.sh $(fault4)
	sfbuild config.sh $(fault6)


faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt
	ls $(fault6)/iges/*.igs >> faults.txt

geo: faults
	sfgeo faults.txt -union=$(union) > $(project).geo
	rm -rf faults.txt

mesh:
	gmsh $(project).$(ext) -2 \
                -tol $(tol) \
		-log $(project)_$(clmax)m.log \
                -clmin $(clmin) \
                -clmax $(clmax) \
		-order $(order) \
 		-algo $(algo) \
 		-smooth $(smooth) \
		-cpu \
                -o $(project)_$(clmax)m.msh 

clean:
	rm -rf $(fault1)
	rm -rf $(fault2)
	rm -rf $(fault3)
	rm -rf $(fault4)
	rm -rf $(fault5)
	rm -rf $(fault6)
	rm -f *.log *.geo *.msh *.vtk

