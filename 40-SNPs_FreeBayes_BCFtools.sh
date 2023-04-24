#!/bin/bash

###################################################
#                                                 #
# Filtering Snps for BCFtools output             #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/bwa
# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/SNPs
mkdir -p $PATH_OUT_VCF

bcftools view -v snps $IN_PATH/freebayes_100_samples_chr01-chr12.vcf > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_snps.vcf
