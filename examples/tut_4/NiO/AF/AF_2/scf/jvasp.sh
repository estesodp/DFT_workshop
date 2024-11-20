#!/bin/bash
### Using bash
#$ -S /bin/bash
### Combine output and error messages
#$ -j y
#$ -o vasp.outerr.$JOB_ID
### Work in the directory where submitted
#$ -cwd
### submit to special all queue
#$ -q all.q@node05 
### request 24 slot
#$ -pe mpi 20
### request maximum of 2880 minute of compute time
###$ -l h_rt=48:00:00
echo " ############### SGE Script Started ############"
# Use modules to setup the runtime environment
. /etc/profile
# Source Intel compilers
source /opt/apps/intel/oneapi/setvars.sh
# Interesting general info:
date
pwd
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/apps/hdf5-1.14.3-1api/lib"
# Execute the job
mpirun -np 20 /opt/apps/vasp.6.4.2/bin/vasp_std 
# finish up
date 
echo " ############### SGE Script Finished ############"
exit
############################################
