#!/bin/bash

###################################################
#                                                 #
# Creating in- and output files for the filtering #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/bwa

# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/bwa
mkdir -p $PATH_OUT_VCF

# Separating SNPs, MNPs, INDELs, and COMPLEX 
vcffilter -f "TYPE = snp" \
    $IN_PATH/freebayes_bwa_ALL_VCF.vcf \
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_SNPs.vcf

vcffilter -f "TYPE = mnp" \
    $IN_PATH/freebayes_BWA_ALL_VCF.vcf \
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_MNPs.vcf

vcffilter -f "TYPE = ins | TYPE = del" \
    $IN_PATH/freebayes_BWA_ALL_VCF.vcf \
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_INDELs.vcf

vcffilter -f "TYPE = complex" \
    $IN_PATH/freebayes_BWA_ALL_VCF.vcf \
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_COMPLEX.vcf    


# Filtering variant calls according some basic heuristics
# QUAL >= 20 (probability of actual variant > 0.99)

vcffilter -f " ( QUAL > 1 ) " \
    $IN_PATH/ /freebayes_BWA_ALL_VCF_SNPs.vcf \
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_SNPs_Qual.vcf

vcffilter -g "DP > 61 " \
    $IN_PATH/ //freebayes_BWA_ALL_VCF_SNPs_Qual.vcf\
    > $PATH_OUT_VCF/freebayes_BWA_ALL_VCF_SNPs_Qual_DP.vcf

#vcffilter -g "SAR > 0 " \
 #   $IN_PATH/
  #  > $PATH_OUT_VCF

#vcffilter -g "SAF > 0 " \
 #   $IN_PATH/ 
  #  > $PATH_OUT_VCF
