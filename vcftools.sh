#!/bin/bash

###################################################
#                                                 #
#filter for quality and dp                        #
#                                                 #
###################################################

# path of input vcf files
PATH=/media/rna/INIA/benchmark/VCF_Filteration/BCF_tools/SNPs
#PATH=/media/rna/INIA/benchmark/VCF_Filteration/BCF_tools/SNPs

#filter for quality
vcftools\
 --vcf $PATH/bcftools_bwa_bcfmerge_snps.vcf\
 --minQ 30\
 --out $PATH/bcftools_bwa_bcfmerge_snps_Q.vcf 

#filter for dp
vcftools\
 --vcf $PATH/bcftools_bwa_bcfmerge_snps_Q.vcf\
 --minDP 61\
 --out $PATH/bcftools_bwa_bcfmerge_snps_Q_DP.vcf 





bcftools view -e 'QUAL <= 30' octopus_bowtie2_bcfmerge_snps.vcf  -o octopus_bowtie2_bcfmerge_snps_Q.vcf
bcftools view -e 'INFO/DP <= 60' octopus_bowtie2_bcfmerge_snps_Q.vcf -o octopus_bowtie2_bcfmerge_snps_Q_DP.vcf