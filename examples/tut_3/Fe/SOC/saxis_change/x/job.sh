#!/bin/bash
#PBS -N Fe_x
#PBS -q little
#PBS -l nodes=1:ppn=16
#PBS -V

cd $PBS_O_WORKDIR

mpirun -n 16 -N 16 /home/amrb/vasp/vasp.5.4.4.pl2/bin/vasp_ncl > vasp.out
                                                               
