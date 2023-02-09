#!/bin/bash

###################################################
#                                                 #
# Selecting only snps for gatk#
#                                                 #
###################################################

# Paths for input , reference and output
#IN_PATH=/media/rna/INIA/benchmark/VCF_Filteration/Gatk4
reference=/media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa

PATH_OUT=/media/rna/INIA/benchmark/VCF_Filteration/Gatk4/SNPs
mkdir -p $PATH_OUT
cd /media/rna/INIA/benchmark/VCF_Filteration/Gatk4

/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk GenotypeGVCFs \
   -R $reference \
   -V gatk4_bowtie2_All.g.vcf.gz \
   -O gatk4_bowtie2_All_genotype.g.vcf.gz

#select only snps from gatk output
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk ValidateVariants -R /media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa  --validation-type-to-exclude ALLELES -V gatk4_bwa_combinemerge_test.g.vcf
/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk SelectVariants \
     -R $reference \
     -V gatk4_bowtie2_All_genotype.g.vcf.gz \
     --select-type-to-include SNP \
     -O  $PATH_OUT/gatk4_bowtie2_All_genotype_snps.g.vcf.gz


