#!/bin/bash

PATH=/media/rna/INIA/benchmark/VCF_Filteration/BCF_BWA


#Filter1: remove indels
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \
--remove-indels \
--out $PATH/BCF_BWA_VCF_exclude_indels.vcf \
  
#Filter2: minQ
vcftools \
--vcf $PATH/BCF_BWA_VCF_exclude_indels.vcf  \

--out $PATH \

#Filter3: 
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \

--out $PATH \

#Filter4: 
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \

--out $PATH \

#Filter5: 
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \

--out $PATH \

#Filter6:
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \

--out $PATH \

#Filter7:
vcftools \
--vcf $PATH/BCF_BWA_ALL_VCF.vcf  \

--out $PATH \
