# San Bernardino Fault Zone
project=san_bernardino
fault1=ETRA-LSBM-LGCS-Long_Canyon_fault-CFM5_m500
fault2=ETRA-LSBM-1992_Joshua_Tree_sequence-CFM5_m500
fault3=ETRA-LSBM-MULT-Eureka_Peak_West_Deception_Canyon_fault-CFM5_m500
fault4=ETRA-LSBM-MULT-Burnt_Mountain_East_Wide_Canyon_fault-CFM5_m500

union=1

# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=500
clmax=1000
order=2
algo=meshadapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: long_canyon joshua_tree eureka_peak burnt_mountain

long_canyon:
	sfbuild config.sh $(fault1)

joshua_tree:
	sfbuild config.sh $(fault2)

eureka_peak:
	sfbuild config.sh $(fault3)

burnt_mountain:
	sfbuild config.sh $(fault4)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
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
	gmsh $(project).geo -2 \
                -tol $(tol) \
		-log $(project).log \
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
