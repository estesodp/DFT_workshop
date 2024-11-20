#!/bin/bash
#PBS -N test
#PBS -q little
#PBS -l nodes=1:ppn=16
#PBS -V

cd $PBS_O_WORKDIR

mpirun -n 16 -N 16 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
