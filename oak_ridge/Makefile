# Oak Ridge Fault Zone
project=oak_ridge
fault1=WTRA-ORFZ-SFNV-Northridge_Frew_fault-CFM2_m500
fault2=WTRA-ORFZ-VNTB-Oak_Ridge_fault-MRSH-CFM5_m500
fault3=WTRA-ORFZ-OFFS-Mid_Channel_fault-SRLN-CVMH-CFM5_m500
fault4=WTRA-ORFZ-MULT-Oak_Ridge_fault-CFM5_m500

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

all: download build

download:
	bash download.sh

build: northridge oak_ridge mid_channel oak_ridge_multi

northridge:
	sfbuild config.sh $(fault1)

oak_ridge:
	sfbuild config.sh $(fault2)

mid_channel:
	sfbuild config.sh $(fault3)

oak_ridge_multi:
	sfbuild config.sh $(fault4)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt

crop: faults
	sfbbox meshes/$(fault1).ts \
	       meshes/$(fault2).ts \
	       meshes/$(fault3).ts \
	       meshes/$(fault4).ts \
      	-min_elements=10 > bbox.txt; 
	sfgeo faults.txt bbox.txt > $(project).geo
	rm -rf faults.txt bbox.txt

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
	rm -rf meshes
	rm -rf $(fault1)
	rm -rf $(fault2)
	rm -rf $(fault3)
	rm -rf $(fault4)
	rm -f *.log *.geo *.msh *.vtk
