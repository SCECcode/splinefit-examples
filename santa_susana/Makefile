project=santa_susana
fault1=WTRA-SSFZ-MULT-Santa_Susana_fault-CFM1_m500

# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=500
clmax=1000
order=1
algo=meshadapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: santa_susana

santa_susana:
	sfbuild config.sh $(fault1)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt

crop: faults
	sfbbox meshes/$(fault1).ts \
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
                -o $(project)_$(clmax).msh 

clean:
	rm -rf meshes
	rm -rf $(fault1)
	rm -ff *.log *.geo *.msh *.vtk
