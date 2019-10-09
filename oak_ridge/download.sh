#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
WTRA-ORFZ-SFNV-Northridge_Frew_fault-CFM2_m500.ts
WTRA-ORFZ-VNTB-Oak_Ridge_fault-MRSH-CFM5_m500.ts
WTRA-ORFZ-OFFS-Mid_Channel_fault-SRLN-CVMH-CFM5_m500.ts
WTRA-ORFZ-MULT-Oak_Ridge_fault-CFM5_m500.ts
)

mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done
