#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_west-CFM4_m500.ts
PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_main-CFM4_m500.ts
PNRA-ATEV-MULT-Agua_Tibia_Earthquake_Valley_fault_east-CFM4_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done

