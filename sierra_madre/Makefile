# This example meshes the Sierra Madre fault at 200 m resolution
project=sierra_madre
fault1=WTRA-SMFZ-SMDE-Sierra_Madre_Cucamonga_connector-CFM5_m500
fault2=WTRA-SMFZ-SMDE-Sierra_Madre_fault_low_dip-CFM4_m500

# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=200
clmax=200
order=2
algo=meshadapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: cucamonga low_dip

cucamonga:
	sfbuild config.sh $(fault1)

low_dip:
	sfbuild config.sh $(fault2)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt

crop: faults
	sfbbox meshes/$(fault1).ts meshes/$(fault2).ts \
      	-min_elements=10 > bbox.txt; 
	sfgeo faults.txt bbox.txt > $(project).geo
	rm -rf faults.txt bbox.txt

geo: faults
	sfgeo faults.txt > $(project).geo
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
		-format msh22 \
                -o $(project)_$(clmin).msh 

clean:
	rm -r meshes
	rm -r $(fault1)
	rm -r $(fault2)
	rm -f *.log *.geo *.msh *.vtk
