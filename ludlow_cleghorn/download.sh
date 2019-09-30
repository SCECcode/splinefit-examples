#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
MJVA-LCLZ-LDLW-Ludlow_fault-CFM5_m500.ts
MJVA-LCLZ-CLGL-Cleghorn_Lake_fault-CFM5_m500.ts
)

mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done
