#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
OCBA-SCFZ-SCLI-San_Clemente_fault-LEGG-CFM5_m500.ts
OCBA-SCFZ-SCBR-San_Clemente_fault-LEGG-CFM5_m500.ts
OCBA-SCFZ-SBRI-San_Clemente_fault_nw_strand-CFM5_m500.ts
OCBA-SCFZ-CTLB-San_Clemente_fault_splay-CFM5_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done

