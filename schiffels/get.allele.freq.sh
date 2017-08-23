#!/bin/bash
#
#BATCH --job-name=anglo.saxon.height.snps
#SBATCH --output=anglo.saxon.height.snps
#
#SBATCH --ntasks=1
#SBATCH --time=60:00:00
#SBATCH --mem-per-cpu=50g
module load angsd-0.913-22 
angsd -b /ebc_data/awwohns/reference/schiffels.crams.new/new.download.2/anglo.saxon.bams -doMajorMinor 2 -doMaf 8 -doCounts 1 -out anglo.saxon.height.snps -sites wood_snp_sites_with_chr -rf chrs.txt 
