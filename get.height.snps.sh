#!/bin/bash
#
#BATCH --job-name=all_johns_height
#SBATCH --output=johns_height.txt
#
#SBATCH --ntasks=1
#SBATCH --time=60:00:00
#SBATCH --mem-per-cpu=50g

module load angsd-0.913-22
module load plink-1.9.0


angsd -b /ebc_data/awwohns/selection_v4/references/new_bams.filelist -doHaploCall 1 -doCounts 1 -out all.johns.height -sites /ebc_data/awwohns/height/wood_snp_sites

wait
#Convert to tped
/storage/software/angsd-0.913-22/misc/haploToPlink all.johns.height.haplo.gz all.johns.height
wait 
#Replace N's with 0's
eval 'sed 's/N/0/g' all.johns.height.tped  > temp.all.johns.height.tped'

#Copy the tfam file
eval 'cp all.johns.height.tfam temp.all.johns.height.tfam'

#Convert tped to ped
plink --tfile all.johns.height --recode --out all.johns.height_ped

#Add the rsids
plink --file all.johns.height_ped --update-map /ebc_data/awwohns/reference/dbsnpvcf/dbsnp.ref.update.name.dedup --update-name --recode --out all.johns.height_with_rsid