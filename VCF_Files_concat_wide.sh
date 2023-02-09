#!/bin/bash

#PATH_IN_VCF=/media/rna/INIA/benchmark/Variant_calling/BCF_Tools/bwa-mem/VCF_output
PATH_OUT=/media/rna/INIA/benchmark/VCF_Filteration/Freebayes
#reference=/media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa
#mkdir -p $PATH_OUT


cd /media/rna/INIA/benchmark/Variant_calling/Freebays/BWA-mem/VCF

#for f in *.vcf; do   bgzip "$f"; done
#for f in *.gz ; do tabix -p vcf $f ; done
#for entry in *.gz; do echo $entry; done
#/home/rna/benchmark/rtg-tools/rtg-tools-3.12.1-32d4c2d2/rtg vcfmerge -I /media/rna/INIA/benchmark/Variant_calling/BCF_Tools/bwa-mem/files_names.txt -F -o $PATH_OUT/bcftools_bwa_rtg.vcf.gz

bcftools merge  -l /media/rna/INIA/benchmark/files_names_FB.txt --force-samples -o $PATH_OUT/Freebayes_bwa_bcfmerge.vcf.gz


#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk MergeVcfs -I /media/rna/INIA/benchmark/files_names.list -O $PATH_OUT/gatk4_bwa_bcfmerge.vcf.gz
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk CombineGVCFs -R $reference -V P1-A01-001-AD.vcf.gz \
#-O $PATH_OUT/gatk4_bwa_bcfmerge.vcf.gz


#bcftools view -h P1-A01-001-AD.vcf.gz | grep TAG
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk CombineGVCFs \
#-R $reference \
#-V P1-A02-009-AV.g.vcf.gz \
#-V P1-A05-033-CO.g.vcf.gz \
#-V P1-A06-041-DY.g.vcf.gz \
#-V P1-A07-049-DK.g.vcf.gz \
#-V P1-A09-065-CQ.g.vcf.gz \
#-O $PATH_OUT/gatk4_bwa_combinemerge_test.g.vcf.gz 


