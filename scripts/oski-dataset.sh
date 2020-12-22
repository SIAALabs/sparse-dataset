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
# Paper:
# Optimization of Sparse Matrix-Vector Multiplication on Emerging Multicore
# Platforms by S.William et al 
# Explanation:
# This is one of the important papers describing SpMV optimizations and they
# have used 14 different matrices for performance evaluation.
# Among the dataset, the webbase and lp are truley sparse while others are
# almost diagonal
#

oski_data_set=(https://sparse.tamu.edu/MM/Williams/pdb1HYS.tar.gz
               https://sparse.tamu.edu/MM/Williams/consph.tar.gz
               https://sparse.tamu.edu/MM/Williams/cant.tar.gz
               https://sparse.tamu.edu/MM/Boeing/pwtk.tar.gz
               https://sparse.tamu.edu/MM/Bova/rma10.tar.gz
               https://sparse.tamu.edu/MM/QCD/conf6_0-8x8-30.tar.gz
               https://sparse.tamu.edu/MM/DNVS/shipsec1.tar.gz
               https://sparse.tamu.edu/MM/Williams/mac_econ_fwd500.tar.gz
               https://sparse.tamu.edu/MM/Williams/mc2depi.tar.gz
               https://sparse.tamu.edu/MM/Williams/cop20k_A.tar.gz
               https://sparse.tamu.edu/MM/Hamm/scircuit.tar.gz
               https://sparse.tamu.edu/MM/Williams/webbase-1M.tar.gz
               https://sparse.tamu.edu/MM/Mittelmann/rail4284.tar.gz)

oski_data_name0=(pdb1HYS 
                consph 
                cant 
                pwtk
                rma10
                conf6_0-8x8-30
                shipsec1
                mac_econ_fwd500 
                mc2depi
                cop20k_A
                scircuit
                webbase-1M
                rail4284)

oski_data_name1=(protein 
                fem_spheres 
                fem_cantilever 
                wind_tunnel
                fem_harbor
                qcd
                fem_ship
                economics 
                epidemiology
                fem_accelerator
                circuit
                webbase
                lp)


for i in ${!oski_data_set[*]}; do
    echo ${oski_data_name1[$i]}
    tar xz -C $1 < <(wget -qO- ${oski_data_set[$i]}) && \
        mv $1/${oski_data_name0[$i]} $1/${oski_data_name1[$i]}
done
