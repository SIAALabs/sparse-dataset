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
# CSR5: An Efficient Storage Format for Cross-Platform Sparse Matrix-Vector
# Multiplication by S.William et al
# Explanation:
# This is another interesting paper describing SpMV optimizations. Apart from,
# the 14 different matrices used in oski paper, this paper has another 8
# different sparse matrices
#

csr5_data_set=(https://sparse.tamu.edu/MM/Williams/pdb1HYS.tar.gz
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
               https://sparse.tamu.edu/MM/Mittelmann/rail4284.tar.gz
               https://sparse.tamu.edu/MM/Freescale/circuit5M.tar.gz
               https://sparse.tamu.edu/MM/LAW/eu-2005.tar.gz
               https://sparse.tamu.edu/MM/LAW/in-2004.tar.gz
               https://sparse.tamu.edu/MM/Andrianov/mip1.tar.gz
               https://sparse.tamu.edu/MM/Sandia/ASIC_680k.tar.gz
               https://sparse.tamu.edu/MM/IBM_EDA/dc2.tar.gz
               https://sparse.tamu.edu/MM/Freescale/FullChip.tar.gz
               https://sparse.tamu.edu/MM/Andrianov/ins2.tar.gz)

csr5_data_name0=(pdb1HYS
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
                 rail4284
                 circuit5M
                 eu-2005
                 in-2004
                 mip1
                 ASIC_680k
                 dc2
                 FullChip
                 ins2)

csr5_data_name1=(protein
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
                 lp
                 circuit5m
                 eu2005
                 in2004
                 mip_1
                 asic680k
                 dc_2
                 fullchip
                 ins_2)


for i in ${!csr5_data_set[*]}; do
    echo ${csr5_data_name1[$i]}
    tar xz -C $1 < <(wget -qO- ${csr5_data_set[$i]}) && \
        mv $1/${csr5_data_name0[$i]} $1/${csr5_data_name1[$i]}
done
