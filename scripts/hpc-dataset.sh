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
# CVR: Efficient Vectorization of SpMV on X86 Processors
# Explanation:
# HPC dataset based on this paper
#

cvr_hpc_data_set=(https://sparse.tamu.edu/MM/Williams/pdb1HYS.tar.gz
                  https://sparse.tamu.edu/MM/Williams/consph.tar.gz
                  https://sparse.tamu.edu/MM/Williams/cant.tar.gz
                  https://sparse.tamu.edu/MM/Boeing/pwtk.tar.gz
                  https://sparse.tamu.edu/MM/Bova/rma10.tar.gz
                  https://sparse.tamu.edu/MM/DNVS/shipsec1.tar.gz
                  https://sparse.tamu.edu/MM/Williams/mac_econ_fwd500.tar.gz
                  https://sparse.tamu.edu/MM/Williams/mc2depi.tar.gz
                  https://sparse.tamu.edu/MM/Williams/cop20k_A.tar.gz
                  https://sparse.tamu.edu/MM/Freescale/circuit5M.tar.gz
                  https://sparse.tamu.edu/MM/Andrianov/mip1.tar.gz
                  https://sparse.tamu.edu/MM/Sandia/ASIC_680k.tar.gz
                  https://sparse.tamu.edu/MM/IBM_EDA/dc2.tar.gz
                  https://sparse.tamu.edu/MM/Freescale/FullChip.tar.gz
                  https://sparse.tamu.edu/MM/Andrianov/ins2.tar.gz
                  https://sparse.tamu.edu/MM/PARSEC/Ga41As41H72.tar.gz
                  https://sparse.tamu.edu/MM/PARSEC/Si41Ge41H72.tar.gz
                  https://sparse.tamu.edu/MM/Rajat/rajat31.tar.gz
                  https://sparse.tamu.edu/MM/vanHeukelum/cage15.tar.gz
                  https://sparse.tamu.edu/MM/Oberwolfach/bone010.tar.gz
                  https://sparse.tamu.edu/MM/Rucci/Rucci1.tar.gz
                  https://sparse.tamu.edu/MM/Mittelmann/spal_004.tar.gz
                  https://sparse.tamu.edu/MM/GHS_psdef/ldoor.tar.gz
                  https://sparse.tamu.edu/MM/Belcastro/mouse_gene.tar.gz
                  https://sparse.tamu.edu/MM/Belcastro/human_gene2.tar.gz
                  https://sparse.tamu.edu/MM/GHS_psdef/crankseg_2.tar.gz)


cvr_hpc_data_name0=(pdb1HYS
                    consph
                    cant
                    pwtk
                    rma10
                    shipsec1
                    mac_econ_fwd500
                    mc2depi
                    cop20k_A
                    circuit5M
                    mip1
                    ASIC_680k
                    dc2
                    FullChip
                    ins2
                    Ga41As41H72
                    Si41Ge41H72
                    rajat31
                    cage15
                    bone010
                    Rucci1
                    spal_004
                    ldoor
                    mouse_gene
                    human_gene2
                    crankseg_2)


cvr_hpc_data_name1=(protein
                    fem_spheres
                    fem_cantilever
                    wind_tunnel
                    fem_harbor
                    fem_ship
                    economics
                    epidemiology
                    fem_accelerator
                    circuit5m
                    mip_1
                    asic680k
                    dc_2
                    fullchip
                    ins_2
                    Ga41As41H72s
                    Si41Ge41H72s
                    rajat31s
                    cage15s
                    bone010s
                    Rucci1s
                    spal_004s
                    ldoors
                    mouse_genes
                    human_gene2s
                    crankseg_2s)


for i in ${!cvr_hpc_data_set[*]}; do
    echo ${cvr_hpc_data_name1[$i]}
    tar xz -C $1 < <(wget -qO- ${cvr_hpc_data_set[$i]}) && \
        mv $1/${cvr_hpc_data_name0[$i]} $1/${cvr_hpc_data_name1[$i]}
done
