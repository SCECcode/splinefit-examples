# This example meshes the Sierra Madre fault at 200 m resolution
project=sierra_madre
fault1=WTRA-SMFZ-SMDE-Sierra_Madre_Cucamonga_connector-CFM5_m500
fault2=WTRA-SMFZ-SMDE-Sierra_Madre_fault_low_dip-CFM4_m500

# Gmsh meshing options
# see: gmsh -help
tol=100.0
clmin=200.0
clmax=200.0
order=2
algo=meshadapt
smooth=3

geometry: cucamonga low_dip

cucamonga:
	sfbuild config.sh $(fault1)

low_dip:
	sfbuild config.sh $(fault2)

join:
	rm -f join.txt; touch join.txt
	ls $(fault1)/iges/*.igs >> join.txt
	ls $(fault2)/iges/*.igs >> join.txt

crop: join
	sfbbox meshes/$(fault1).ts meshes/$(fault2).ts \
      	--min_elements=10 > bbox.txt; 
	sfgeo join.txt bbox.txt > $(project).geo
	rm -rf join.txt bbox.txt

geo: join
	sfgeo join.txt > $(project).geo
	rm -rf join.txt

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
                -o $(project).msh 

clean:
	rm -r meshes
	rm -r $(fault1)
	rm -r $(fault2)
	rm -f *.log *.geo *.msh *.vtk
