module load vcftools
for chr in {1..22}; do
vcftools --gzvcf ../reference/1000Genomes_panels/IBS.vcfs/ALL.chr${chr}.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz.IBS.vcf.gz  --snps wood_snp_names --recode --recode-INFO-all --out IBS.results/chr${chr}.height.snps
done
