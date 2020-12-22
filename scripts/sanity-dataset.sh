#!/bin/bash

#
# USAGE: ./<script> <output_location>
#

if [ $# -eq 0 ]; then
    echo "ERROR: No input argument provided"
    echo "USAGE: ./<script> <output_location>"
    exit 1
fi

#
# dataset for sanity testing
#

sanity_data_set=(https://sparse.tamu.edu/MM/Williams/pdb1HYS.tar.gz
                 https://sparse.tamu.edu/MM/Boeing/pwtk.tar.gz)

sanity_data_name0=(pdb1HYS
                   pwtk)

sanity_data_name1=(protein
                   wind_tunnel)

for i in ${!sanity_data_set[*]}; do
    echo ${sanity_data_name1[$i]}
    tar xz -C $1 < <(wget -qO- ${sanity_data_set[$i]}) && \
        mv $1/${sanity_data_name0[$i]} $1/${sanity_data_name1[$i]}
done
