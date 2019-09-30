# Sierra Madre Fault Zone
project=sierra_madre
fault1=WTRA-SMFZ-MULT-Sierra_Madre_fault_west-CFM4_m500
fault2=WTRA-SMFZ-SWCC-Sierra_Madre_fault_low_dip-CFM4_m500
fault3=WTRA-SMFZ-SMDE-Sierra_Madre_fault_low_dip-CFM4_m500
fault4=WTRA-SMFZ-SMDE-Sierra_Madre_Cucamonga_connector-CFM5_m500
fault5=WTRA-SMFZ-SMDD-Sierra_Madre_fault_low_dip-CFM4_m500

# Construct conforming mesh (yes/no)
union=0

# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=500
clmax=1000
order=0
algo=meshadapt
smooth=3
ext=geo

################################################################################

all: download build

download:
	bash download.sh

build: multiple clamshell section_E cucamonga section_D

multiple:
	sfbuild config.sh $(fault1)

clamshell:
	sfbuild config.sh $(fault2)

section_E:
	sfbuild config.sh $(fault3)

cucamonga:
	sfbuild config.sh $(fault4)

section_D:
	sfbuild config.sh $(fault5)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt
	ls $(fault5)/iges/*.igs >> faults.txt

geo: faults
	sfgeo faults.txt -union=$(union) > $(project).geo
	rm -rf faults.txt

mesh:
	gmsh $(project).$(ext) -2 \
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
	rm -rf $(fault5)
	rm -f *.log *.geo *.msh *.vtk
