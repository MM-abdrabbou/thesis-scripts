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
#PATH_IN=/media/rna/INIA/benchmark/VCF_Filteration/Gatk4/bwa
#cd /media/rna/INIA/benchmark/VCF_Filteration/Gatk4/bwa

/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk GenotypeGVCFs \
   -R $reference \
   -V gendb:///media/rna/INIA/benchmark/VCF_Filteration/Gatk4/bwa \
   --max-genotype-count 500000 \
   -O $PATH_OUT/gatk4_bwa_All_genotype.g.vcf.gz

#select only snps from gatk output
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk ValidateVariants -R /media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa  --validation-type-to-exclude ALLELES -V gatk4_bwa_combinemerge_test.g.vcf
/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk SelectVariants \
     -R $reference \
     -V $PATH_OUT/gatk4_bwa_All_genotype.g.vcf.gz \
     --select-type-to-include SNP \
     -O  $PATH_OUT/gatk4_bwa_All_snps.g.vcf.gz


#--max-alternate-alleles 75 \