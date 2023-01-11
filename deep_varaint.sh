#!/bin/bash

##############################################################################################################################################
										
#collect deepvariant script		      #

##############################################################################################################################################
BIN_VERSION="1.4.0"
PATH_IN_BAMS=/media/rna/INIA/benchmark/Alignment/BWA/BWA_BAM
PATH_REF_FILE=/media/rna/INIA/benchmark/Variant_calling/deep_variant/reference
PATH_VCF_OUT=/media/rna/INIA/benchmark/Variant_calling/deep_variant/bwa/VCF_output
mkdir -p $PATH_VCF_OUT
PATH_STAT_OUT=/media/rna/INIA/benchmark/Variant_calling/deep_variant/bwa/stat
mkdir -p $PATH_STAT_OUT

for folder in ${PATH_IN_BAMS}/*; do
	sample=$(basename $folder)
  # Specifying file name for compuation times for each chromosome
  COMP=${PATH_STAT_OUT}/computation_times_${sample}.txt
  dv_start=`date +%s`

  sudo docker run \
  -v "${PATH_IN_BAMS}":"/input" \
  -v "${PATH_VCF_OUT}":"/output" \
  -v "${PATH_REF_FILE}":"/ref"  \
  google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \
  --ref=/ref/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa \
  --reads=/input/${sample}/${sample}_sorted.bam \
  --output_vcf=/output/${sample}.vcf.gz \
  --output_gvcf=/output/${sample}.g.vcf.gz
  dv_end=`date +%s`
  dv_time=$(($dv_end-dv_start))
  echo "deep variant calling time in s ($sample):	$dv_time" >> $COMP
done
