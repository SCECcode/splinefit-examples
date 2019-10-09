# This example meshes the Garlock fault zone
project=garlock
fault1=GRFS-GRFZ-WEST-Garlock_fault-CFM5_m500
fault2=GRFS-GRFZ-EAST-Owl_Lake_fault-CFM5_m500
fault3=GRFS-GRFZ-EAST-Garlock_fault-CFM5_m500

ext=geo
union=0
# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=500
clmax=500
order=1
algo=meshAdapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: garlock_west owl_lake garlock_east

garlock_west:
	sfbuild config.sh $(fault1)

owl_lake:
	sfbuild config.sh $(fault2)

garlock_east:
	sfbuild config.sh $(fault3)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt

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
	rm -r meshes
	rm -r $(fault1)
	rm -r $(fault2)
	rm -r $(fault3)
	rm -f *.log *.geo *.msh *.vtk

