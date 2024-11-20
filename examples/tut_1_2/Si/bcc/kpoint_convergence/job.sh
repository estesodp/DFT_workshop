#!/bin/bash
#PBS -N Si_bcc
#PBS -q little
#PBS -l nodes=1:ppn=4
#PBS -V

cd $PBS_O_WORKDIR

for k in {4..22..1};do
cat KPOINTS_0 | sed "s/<k>/$k/g" > KPOINTS
mkdir $k
cp INCAR KPOINTS POSCAR POTCAR $k/.
cd $k/
mpirun -n 4 -N 4 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
cd ../
done
