#!/bin/bash
PATH_IN_VCF=/media/rna/INIA/benchmark/Variant_calling/Freebays/BWA-mem/VCF
PATH_OUT=/media/rna/INIA/benchmark/VCF_Filteration
mkdir -p $PATH_OUT


for folder in ${PATH_IN_VCF}/*.vcf; do
	#sample=$(basename $folder)
    cat $folder >> $PATH_OUT/freebayes_bwa_ALL_VCF.vcf 

done

exit


