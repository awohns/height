module load vcftools-0.1.14
module load plink-1.9.0

echo "input vcf directory"
read input
echo "input output directory"
read output

#(cd ${input} && ls *.vcf > vcf.list.txt)

vcf-concat `ls -v ${input}/*.vcf` | gzip -c > ${input}/all.vcfs.merged.vcf.gz

#for file in ${input}/*; do
#file_no_path=${file##*/}
#vcftools --vcf ${file} --plink --out ${output}/${file_no_path}
#done 

#(cd ${input} && ls *.vcf > ../${output}/all.files.plink.txt)

vcftools --gzvcf ${input}/all.vcfs.merged.vcf.gz --plink --out ${output}/plink.all.chrs

plink --file ${output}/plink.all.chrs --a1-allele height_snp_ref --freq --out ${output}/height.freqs
