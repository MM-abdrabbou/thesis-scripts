#!/bin/bash

###################################################
#                                                 #
# Creating in- and output files for the filtering #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/bwa

# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/SNPs
mkdir -p $PATH_OUT_VCF

# Extracting the file name for subsequent appending
#file=$(basename $vcfFile)
#extension=${file##*.} # extracting "vcf"
#filename=${file%.*} # Extracting the name w\o extension


# Separating SNPs, MNPs, INDELs, and COMPLEX 
vcffilter -f "TYPE = snp" \
    $IN_PATH/freebayes_100_samples_chr01-chr12.vcf \
    > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_SNPs.vcf

vcffilter -f "TYPE = mnp" \
    $IN_PATH/freebayes_100_samples_chr01-chr12.vcf \
    > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_MNPs.vcf

vcffilter -f "TYPE = ins | TYPE = del" \
    $IN_PATH/freebayes_100_samples_chr01-chr12.vcf \
    > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_INDELs.vcf

vcffilter -f "TYPE = complex" \
    $IN_PATH/freebayes_100_samples_chr01-chr12.vcf \
    > $PATH_OUT_VCF/freebayes_100_samples_chr01-chr12_COMPLEX.vcf    


# Filtering variant calls according some basic heuristics
# QUAL >= 20 (probability of actual variant > 0.99)

#vcffilter -f " ! ( QUAL < 20 ) " -g "DP > 61 &  " \
#    $IN_PATH/ \
#    >
#done
