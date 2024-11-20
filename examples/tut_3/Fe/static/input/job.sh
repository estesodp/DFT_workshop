#!/bin/bash
#PBS -N Fe_static
#PBS -q little
#PBS -l nodes=1:ppn=4
#PBS -V

cd $PBS_O_WORKDIR

mpirun -n 4 -N 4 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
