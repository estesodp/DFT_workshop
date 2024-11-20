#!/bin/sh
eq_latt_const=4.176000
list_of_value=`seq 0.86 0.02 1.24`
for i in $list_of_value; do

# length
a=$(echo "scale=10;$i*$eq_latt_const" | bc)
cd out_$a
echo $a
E=$(grep TOTEN OUTCAR|tail -1)

cd ..
echo $a $E >>strain.dat
done

