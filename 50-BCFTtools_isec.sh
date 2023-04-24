#!/bin/bash


# This script generates all the pairwise intresections among the 7 pipelines using bcftools isec

IN_PATH1=/media/rna/INIA/benchmark/Concordance/bcftools_isec/PATH_1
IN_PATH2=/media/rna/INIA/benchmark/Concordance/bcftools_isec/PATH_2
Out=/media/rna/INIA/benchmark/Concordance/bcftools_isec/Output

for file1 in $IN_PATH1/*.gz; do
    pip1=$(basename $file1 .vcf.gz)
    for file2 in $IN_PATH2/*.gz; do
        pip2=$(basename $file2 .vcf.gz)
        mkdir $Out/${pip1}_${pip2}
        bcftools isec -p $Out/${pip1}_${pip2} $file1 $file2 
    done
done 

#bcftools query -f '%CHROM\_%POS\n'  | head
