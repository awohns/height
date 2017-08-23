#!/bin/bash
#
#BATCH --job-name=ironheightsnps
#SBATCH --output=ironheightsnps
#
#SBATCH --ntasks=1
#SBATCH --time=60:00:00
#SBATCH --mem-per-cpu=50g
module load angsd-0.913-22 
angsd -b /ebc_data/awwohns/reference/schiffels.crams.new/new.download.2/iron.age.bams -doMajorMinor 2 -doMaf 8 -doCounts 1 -out iron.age.height.snps -sites wood_snp_sites -rf chrs.txt 
