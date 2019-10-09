#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
MJVA-ECSZ-1992_Landers_cross_fault_North_II-CFM5_m500.ts
MJVA-ECSZ-1992_Landers_cross_fault_North_I-CFM5_m500.ts
MJVA-ECSZ-1992_Landers_rupture_detailed_splays-CFM3_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done

