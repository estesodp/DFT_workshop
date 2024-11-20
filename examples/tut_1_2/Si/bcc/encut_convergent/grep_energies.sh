#!/bin/sh
for dir in */; do
cd $dir
echo $dir

E=$(grep TOTEN OUTCAR|tail -n 1 | awk '{print $5}')

cd ../
echo $dir $E >> conv_energies.dat
done
