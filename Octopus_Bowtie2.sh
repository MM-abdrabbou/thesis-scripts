#!/bin/bash

#######################################################################
#								      #	
# Call variants from BAM files mapped by Bowtie2 using  Octopus       #
#                                                                     #
#######################################################################

PATH_IN_BAMS=/media/rna/INIA/benchmark/Alignment/Bowtie2/Alignment_BAM
PATH_REF_FILE=/media/rna/INIA/benchmark/Alignment/Bowtie2/Reference_Bowtie2/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa
PATH_VCF_OUT=/media/rna/INIA/benchmark/Variant_calling/octopus/Bowtie2/VCF_output
mkdir -p $PATH_VCF_OUT
PATH_STAT_OUT=/media/rna/INIA/benchmark/Variant_calling/octopus/Bowtie2/stat
mkdir -p $PATH_STAT_OUT

for folder in ${PATH_IN_BAMS}/*; do
	sample=$(basename $folder)
  # Specifying file name for compuation times for each chromosome
  COMP=${PATH_STAT_OUT}/computation_times_${sample}.txt
  #realign=${PATH_VCF_OUT}/realigned_${sample}.bam
  oct_start=`date +%s`

   #validate and check for the read groups
  /media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk ValidateSamFile   -I $PATH_IN_BAMS/$sample/*_sorted*.bam -R $PATH_REF_FILE MODE= SUMMARY
    #fix the readgroup issue
  /media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk AddOrReplaceReadGroups -I $PATH_IN_BAMS/$sample/*_sorted*.bam -O $PATH_VCF_OUT/$sample.bam -SORT_ORDER coordinate -RGID foo -RGLB bar -RGPL illumina -RGPU barcode  -RGSM Sample1 -CREATE_INDEX True
  
  /home/rna/Downloads/octopus/bin/octopus --reference $PATH_REF_FILE \
  --reads $PATH_VCF_OUT/$sample.bam \
  --organism-ploidy 4 \
  --disable-call-filtering \
  -o $PATH_VCF_OUT/$sample.vcf \
  --max-genotypes 100\
  --backtrack-level AGGRESSIVE \
  --threads 6

  oct_end=`date +%s`
  oct_time=$(($oct_end-oct_start))
  echo "octopus variant calling time in s ($sample):	$oct_time" >> $COMP
done 
exit
#--disable-denovo-variant-discovery \
#--refcall \
#--lagging-level OPTIMSITIC \
#--data-profile \
#--bamout ${PATH_VCF_OUT}/realigned_${sample}.bam \
#--fast --very-fast #turns out some features to run faster
#--variant-discovery-mode arg (=ILLUMINA)
#--max-haplotypes  400\

#--filter-expression arg (=QUAL < 10 | MQ < 10 | MP < 10 | AD < 1 | AF < 0.01 | AFB > 0.25 | SB > 0.98 | BQ < 15 | DP < 1 | ADP < 1)
#sudo docker run dancooke/octopus --reference DM_1-3_516_R44_potato_genome_assembly.v6.1.fa --reads P1-A01-001-AD_sorted.bam --organism-ploidy 4 
