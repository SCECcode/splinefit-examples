SetFactory("OpenCASCADE");
a1() = ShapeFromFile("PNRA-ELSZ-WHIT-Workman_Hill_fault-CFM1_m500/iges/surface_0.igs");
a2() = ShapeFromFile("PNRA-ELSZ-WHIT-Whittier_fault-CFM4_m500/iges/surface_0.igs");
a3() = ShapeFromFile("PNRA-ELSZ-GLIV-Glen_Ivy_South_fault-CFM4_m500/iges/surface_0.igs");
a4() = ShapeFromFile("PNRA-ELSZ-GLIV-Glen_Ivy_North_fault-CFM4_m500/iges/surface_0.igs");
a5() = ShapeFromFile("PNRA-ELSZ-CHNO-Chino_fault_main-CFM4_m500/iges/surface_0.igs");
a6() = ShapeFromFile("PNRA-ELSZ-CHNO-Chino_fault_Central_Ave-CFM4_m500/iges/surface_0.igs");
a7() = ShapeFromFile("PNRA-CRSF-CHNH-Yorba_Linda_lineament-CFM2_m500/iges/surface_0.igs");
a8() = ShapeFromFile("PNRA-ELSZ-WHIT-Whittier_Heights_fault-CFM1_m500/iges/surface_0.igs");
BooleanUnion { Surface{1}; Surface{2}; Surface{7}; Delete; }{ Surface{8}; Delete; }
