#!/bin/bash

#############################################################################
#                                                                           #
# Octopus and gatk has a problem in individual sample naming                #   
# so this script was used to change sample names before merging vcf files   #
#                                                                           #
#############################################################################


#PATH_IN_VCF=/media/rna/INIA/benchmark/Variant_calling/BCF_Tools/bwa-mem/VCF_output
PATH_OUT=/media/rna/INIA/benchmark/Variant_calling/BCF_Tools/bowtie_nnsamples
mkdir -p $PATH_OUT



file=/media/rna/INIA/benchmark/Variant_calling/gatk/sample.txt
cd /media/rna/INIA/benchmark/Variant_calling/BCF_Tools/Bowtie2/VCF_output
#for f in *.vcf; do   bgzip "$f"; done
#for f in *.gz ; do tabix -p vcf $f ; done
#for entry in *.gz; do echo $entry; done

#loop over the 100 samples to change their names in the vcf files
for folder in *.vcf ; do
    sample=$(basename $folder .vcf)
    echo $sample >> $file
    bcftools reheader -s ${file}  $sample.vcf -o ${PATH_OUT}/$sample.vcf
    >  ${file} ;
done 



