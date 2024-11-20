#!/bin/bash
#PBS -N Si_fcc
#PBS -q little
#PBS -l nodes=1:ppn=4
#PBS -V

cd $PBS_O_WORKDIR

for e in $(seq 1.025 0.005 1.04); do
cat POSCAR_0 | sed "s/<e>/$e/g" > POSCAR
mkdir $e
cp POSCAR KPOINTS INCAR POTCAR $e/.
cd $e
mpirun -n 4 -N 4 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
cd ../
done
