#!/bin/bash
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(
GRFS-GRFZ-WEST-Garlock_fault-CFM5_m500.ts
GRFS-GRFZ-EAST-Owl_Lake_fault-CFM5_m500.ts
GRFS-GRFZ-EAST-Garlock_fault-CFM5_m500.ts
)
mkdir -p meshes
for file in ${files[@]}
do
        curl $url/${file} --output meshes/${file}
done

