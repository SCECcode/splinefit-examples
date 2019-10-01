#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
MJVA-HPFZ-MULT-Gravel_Hills_Harper_Lake_fault-CFM5_m500.ts
MJVA-HPFZ-GVHS-Gravel_Hills_fault_nw-CFM5_m500.ts
MJVA-HPFZ-HPVS-Harper_Valley_Mt_General_fault-CFM5_m500.ts
MJVA-HPFZ-GVHS-Harper_Valley_fault-CFM5_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done

