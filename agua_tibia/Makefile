# This example meshes the Agua Tibia Earthquake Valley fault zone
project=agua_tibia
fault1=PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_west-CFM4_m500
fault2=PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_main-CFM4_m500
fault3=PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_east-CFM4_m500


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

build: west main east

west:
	sfbuild config.sh $(fault1)

main:
	sfbuild config.sh $(fault2)

east:
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

