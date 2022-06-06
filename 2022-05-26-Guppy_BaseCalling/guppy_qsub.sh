#!/bin/sh
#$ -cwd
#$ -pe smp 8
#$ -l h_vmem=11G
#$ -l gpu=1
#$ -l gpu_type="volta|ampere"
#$ -l h_rt=240:0:0
#$ -j y

# Device auto will choose GPU if available
# Change the config file to use your own

module load nanopore_guppy

nanopore_guppy guppy_basecaller -i input/2022-05-30-Combine-pass-and-fail -s tmp/ \
-c dna_r9.5_450bps.cfg --device auto --detect_mid_strand_adapter
