project=ludlow_cleghorn
fault1=MJVA-LCLZ-LDLW-Ludlow_fault-CFM5_m500
fault2=MJVA-LCLZ-CLGL-Cleghorn_Lake_fault-CFM5_m500

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

build: ludlow cleghorn

ludlow:
	sfbuild config.sh $(fault1)

cleghorn:
	sfbuild config.sh $(fault2)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt

crop: faults
	sfbbox meshes/$(fault1).ts \
	       meshes/$(fault2).ts \
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
                -o $(project)_$(clmax)m.msh 

clean:
	rm -rf meshes
	rm -rf $(fault1)
	rm -rf $(fault2)
	rm -f *.log *.geo *.msh *.vtk
