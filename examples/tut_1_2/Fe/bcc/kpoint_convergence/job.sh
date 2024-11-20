#!/bin/bash
#PBS -N Fe_bcc
#PBS -q little
#PBS -l nodes=1:ppn=4
#PBS -V

cd $PBS_O_WORKDIR

for k in $(seq 0.1 0.01 0.4);do
cat INCAR_0 | sed "s/<k>/$k/g" > INCAR
mkdir $k
cp INCAR KPOINTS POSCAR POTCAR $k/.
cd $k/
mpirun -n 4 -N 4 /home/amrb/vasp/vasp.6.2.0/bin/vasp_std > vasp.out
cd ../
done
