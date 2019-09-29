# This example meshes a few faults in the Peninsular ranges fault system
project=peninsular_ranges
fault1=PNRA-ELSZ-WHIT-Workman_Hill_fault-CFM1_m500
fault2=PNRA-ELSZ-WHIT-Whittier_fault-CFM4_m500
fault3=PNRA-ELSZ-GLIV-Glen_Ivy_South_fault-CFM4_m500
fault4=PNRA-ELSZ-GLIV-Glen_Ivy_North_fault-CFM4_m500
fault5=PNRA-ELSZ-CHNO-Chino_fault_main-CFM4_m500
fault6=PNRA-ELSZ-CHNO-Chino_fault_Central_Ave-CFM4_m500
fault7=PNRA-CRSF-CHNH-Yorba_Linda_lineament-CFM2_m500
fault8=PNRA-ELSZ-WHIT-Whittier_Heights_fault-CFM1_m500

# Gmsh meshing options (see: gmsh -help for documentation)
tol=1e-2
clmin=500.0
clmax=500.0
order=2
algo=meshadapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: workman whittier glen_ivy_south glen_ivy_north chino_main chino_central \
	yorba whittier_heights

workman:
	sfbuild config.sh $(fault1)

whittier:
	sfbuild config.sh $(fault2)

glen_ivy_south:
	sfbuild config.sh $(fault3)

glen_ivy_north:
	sfbuild config.sh $(fault4)

chino_main:
	sfbuild config.sh $(fault5)

chino_central:
	sfbuild config.sh $(fault6)

yorba:
	sfbuild config.sh $(fault7)

whittier_heights:
	sfbuild config.sh $(fault8)

faults:
	rm -f faults.txt; touch faults.txt
	ls $(fault1)/iges/*.igs >> faults.txt
	ls $(fault2)/iges/*.igs >> faults.txt
	ls $(fault3)/iges/*.igs >> faults.txt
	ls $(fault4)/iges/*.igs >> faults.txt
	ls $(fault5)/iges/*.igs >> faults.txt
	ls $(fault6)/iges/*.igs >> faults.txt
	ls $(fault7)/iges/*.igs >> faults.txt
	ls $(fault8)/iges/*.igs >> faults.txt

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
                -o $(project)_$(clmin).msh 

mesh-brep:
	gmsh $(project).brep -2 \
                -tol $(tol) \
		-log $(project).log \
                -clmin $(clmin) \
                -clmax $(clmax) \
		-order $(order) \
 		-algo $(algo) \
 		-smooth $(smooth) \
		-cpu \
                -o $(project)_$(clmin)m.msh 

clean:
	rm -r meshes
	rm -r $(fault1)
	rm -r $(fault2)
	rm -r $(fault3)
	rm -r $(fault4)
	rm -r $(fault5)
	rm -r $(fault6)
	rm -r $(fault7)
	rm -r $(fault8)
	rm -f $(project).log $(project).geo $(project).msh
