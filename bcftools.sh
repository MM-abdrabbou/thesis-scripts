#!/bin/bash

###################################################
#                                                 #
# Filtering Snps for BCF tools output             #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/bwa
# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/SNPs
mkdir -p $PATH_OUT_VCF

bcftools view -v snps $IN_PATH/freebayes_100_samples_chr01-chr12.vcf > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_snps.vcf
#vcffilter -g "SAR > 0 " \
 #   $IN_PATH/
  #  > $PATH_OUT_VCF

#vcffilter -g "SAF > 0 " \
 #   $IN_PATH/ 
  #  > $PATH_OUT_VCF