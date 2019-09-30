# This example meshes the San Clemente fault system 
project=san_clemente
fault1=OCBA-SCFZ-SCLI-San_Clemente_fault-LEGG-CFM5_m500
fault2=OCBA-SCFZ-SCBR-San_Clemente_fault-LEGG-CFM5_m500
fault3=OCBA-SCFZ-SBRI-San_Clemente_fault_nw_strand-CFM5_m500
fault4=OCBA-SCFZ-CTLB-San_Clemente_fault_splay-CFM5_m500

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

build: island basin santa_barbara catalina

island:
	sfbuild config.sh $(fault1)

basin:
	sfbuild config.sh $(fault2)

santa_barbara:
	sfbuild config.sh $(fault3)

catalina:
	sfbuild config.sh $(fault4)


faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt

geo: faults
	sfgeo faults.txt > $(project).geo
	rm -rf faults.txt

mesh:
	gmsh $(project).geo -2 \
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

