#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
ETRA-LSBM-LGCS-Long_Canyon_fault-CFM5_m500.ts
ETRA-LSBM-1992_Joshua_Tree_sequence-CFM5_m500.ts
ETRA-LSBM-MULT-Eureka_Peak_West_Deception_Canyon_fault-CFM5_m500.ts
ETRA-LSBM-MULT-Burnt_Mountain_East_Wide_Canyon_fault-CFM5_m500.ts
)

mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done
