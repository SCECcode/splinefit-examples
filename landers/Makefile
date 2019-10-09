project=landers
fault1=MJVA-ECSZ-1992_Landers_cross_fault_North_II-CFM5_m500
fault2=MJVA-ECSZ-1992_Landers_cross_fault_North_I-CFM5_m500
fault3=MJVA-ECSZ-1992_Landers_rupture_detailed_splays-CFM3_m500
ext=brep
union=1
# Gmsh meshing options (see: gmsh -help for documentation)
tol=100.0
clmin=250
clmax=250
order=1
algo=meshadapt
smooth=3

################################################################################

all: download build

download:
	bash download.sh

build: north_ii north_i splays

north_ii:
	sfbuild config.sh $(fault1)

north_i:
	sfbuild config.sh $(fault2)

splays:
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
	rm -rf meshes
	rm -rf $(fault1)
	rm -rf $(fault2)
	rm -rf $(fault3)
	rm -f *.log *.geo *.msh *.vtk

