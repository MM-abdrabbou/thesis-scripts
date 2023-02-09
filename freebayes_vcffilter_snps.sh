#!/bin/bash

###################################################
#                                                 #
# Creating in- and output files for the filtering #
#                                                 #
###################################################

IN_PATH=/media/rna/INIA/benchmark/Variant_calling/Freebays/BWA-mem/VCF_test

# Creating all output paths for filter strategies
PATH_OUT_VCF=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes/SNPs
#mkdir -p $PATH_OUT_VCF

# Extracting the file name for subsequent appending
#file=$(basename $vcfFile)
#extension=${file##*.} # extracting "vcf"
#filename=${file%.*} # Extracting the name w\o extension

#vcffilter -f "TYPE = snp" \
 #       $IN_PATH/freebayes_bwa_ALL_VCF.vcf\
  #      > $PATH_OUT_VCF/cat_all.vcf 

for file in $IN_PATH/*; do
   sample=$(basename $file)
   vcffilter -f "TYPE = snp" \
        $file \
        > ${PATH_OUT_VCF}/${sample}_snps.vcf ;done

# Filtering variant calls according some basic heuristics
# QUAL >= 20 (probability of actual variant > 0.99)

#vcffilter -f " ! ( QUAL < 20 ) " -g "DP > 61 &  " \
#    $IN_PATH/ \
#    >
#done
