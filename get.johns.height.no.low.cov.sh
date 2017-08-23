module load plink-1.9.0

#Remove low coverage individuals
plink --file johns.height.snps.plink/all.johns.height_with_rsid --remove ../population.statistics.2/low.cov.johns.to.remove.list --make-bed --out johns.height.snps.plink/johns.height.nolowcov5percent

plink --bfile johns.height.snps.plink/johns.height.nolowcov5percent --a1-allele height_snp_ref --freq --out johns.height.snps.plink/johns.height.nolowcov5percent.freqs