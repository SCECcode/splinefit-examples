# This example meshes the Harper Fault Zone
project=harper
fault1=MJVA-HPFZ-MULT-Gravel_Hills_Harper_Lake_fault-CFM5_m500
fault2=MJVA-HPFZ-GVHS-Gravel_Hills_fault_nw-CFM5_m500
fault3=MJVA-HPFZ-HPVS-Harper_Valley_Mt_General_fault-CFM5_m500
fault4=MJVA-HPFZ-GVHS-Harper_Valley_fault-CFM5_m500

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

build: lake hills mt_general valley

lake:
	sfbuild config.sh $(fault1)

hills:
	sfbuild config.sh $(fault2)

mt_general:
	sfbuild config.sh $(fault3)

valley:
	sfbuild config.sh $(fault4)


faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt

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
	rm -r $(fault4)
	rm -f *.log *.geo *.msh *.vtk

