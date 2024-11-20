#!/bin/bash



eq_latt_const=4.176000
list_of_value=`seq 0.86 0.02 1.06`
for i in $list_of_value; do

# length
a=$(echo "scale=10;$i*$eq_latt_const" | bc)
mkdir out_$a
cp POSCAR POTCAR INCAR KPOINTS lat_par_job.sh out_$a/
cd out_$a
sed -i "s/<A>/$a/g" POSCAR
sed -i "s/<name>/$i/g" lat_par_job.sh
cd ..
done

