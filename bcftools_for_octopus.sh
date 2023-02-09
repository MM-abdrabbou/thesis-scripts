#!/bin/bash

###################################################
#                                                 #
# Filtering Snps for BCF tools output             #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Octopus
# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Octopus/SNPs
mkdir -p $PATH_OUT_VCF

bcftools view -v snps $IN_PATH/octopus_bowtie2_bcfmerge.vcf.gz > $PATH_OUT_VCF/octopus_bowtie2_bcfmerge_snps.vcf

#vcffilter -g "SAR > 0 " \
 #   $IN_PATH/
  #  > $PATH_OUT_VCF

#vcffilter -g "SAF > 0 " \
 #   $IN_PATH/ 
  #  > $PATH_OUT_VCF