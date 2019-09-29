#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
PNRA-ELSZ-WHIT-Workman_Hill_fault-CFM1_m500.ts
PNRA-ELSZ-WHIT-Whittier_fault-CFM4_m500.ts
PNRA-ELSZ-GLIV-Glen_Ivy_South_fault-CFM4_m500.ts
PNRA-ELSZ-GLIV-Glen_Ivy_North_fault-CFM4_m500.ts
PNRA-ELSZ-CHNO-Chino_fault_main-CFM4_m500.ts
PNRA-ELSZ-CHNO-Chino_fault_Central_Ave-CFM4_m500.ts
PNRA-CRSF-CHNH-Yorba_Linda_lineament-CFM2_m500.ts
PNRA-ELSZ-WHIT-Whittier_Heights_fault-CFM1_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done
