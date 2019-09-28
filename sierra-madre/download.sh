
url=https://s3-us-west-2.amazonaws.com/files.scec.org/s3fs-public/projects/cfm/CFM5/CFM52_preferred/500m
files=(WTRA-SMFZ-SMDE-Sierra_Madre_Cucamonga_connector-CFM5_m500.ts
WTRA-SMFZ-SMDE-Sierra_Madre_fault_low_dip-CFM4_m500.ts)
mkdir -p meshes
for file in ${files[@]}
do
        echo $url/${file} --output meshes/${file}
        curl $url/${file} --output meshes/${file}
done
