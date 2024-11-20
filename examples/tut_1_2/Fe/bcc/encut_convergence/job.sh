#!/bin/bash
#PBS -N Fe_bcc
#PBS -q little
#PBS -l nodes=1:ppn=4
#PBS -V

cd $PBS_O_WORKDIR

for e in {200..700..50};do
cat INCAR_0 | sed "s/<e>/$e/g" > INCAR
mkdir $e
cp INCAR KPOINTS POSCAR POTCAR $e/.
cd $e/
mpirun -n 4 -N 4 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
cd ../
done
