#!/bin/bash

PATH='/media/rna/INIA/benchmark/Concordance/variantQC/data'
reference="/media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fasta"

/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk VariantFiltration \
    -R $reference \
    -V $PATH/gatk4_bwa.vcf \
    -filter "QUAL > 30.0" --filter-name "QUAL30" \
    -O $PATH/gatk4_bwa_Qual.vcf 

    /media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk VariantFiltration \
    -R DM_1-3_516_R44_potato_genome_assembly.v6.1.fa  -V gatk4_bowtie2.vcf -filter "QUAL > 30.0" --filter-name "QUAL30" -O gatk4_bowtie2_Qual.vcf
