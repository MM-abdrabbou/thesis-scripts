#!/bin/bash
PATH_IN_VCF=/media/rna/INIA/benchmark/Variant_calling/octopus/Bowtie2/VCF_output
PATH_OUT=/media/rna/INIA/benchmark/VCF_Filteration
mkdir -p $PATH_OUT


for folder in ${PATH_IN_VCF}/*.vcf; do
	#sample=$(basename $folder)
    cat $folder >> $PATH_OUT/octopus_bowtie2_ALL_VCF.vcf 

done

exit


