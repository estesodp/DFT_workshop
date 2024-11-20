#!/bin/bash

eq_latt_const=4.176000
list_of_value=`seq 0.86 0.02 0.92`
for i in $list_of_value; do

# length
a=$(echo "scale=10;$i*$eq_latt_const" | bc)
cd out_$a
qsub lat_par_job.sh

cd ..
done

