#!/bin/bash

#delete unnecessary files 
#cd /media/rna/INIA/benchmark/Data_Filtered_stat_1
#find -type f -name '*_trimR.fastq.bz2*' -delete
#find -type f -name '*_trimRL.fastq.bz2*' -delete
#find -type f -name '*_out_qualtrim.txt*' -delete


#find -type f -name '*_err_qualtrim.txt*' -delete
#find -type f -name '*_stats_qualtrim.txt*' -delete

IN_PATH=/media/rna/INIA/benchmark/Data_Filtered
OUT_PATH=/media/rna/INIA/benchmark/Data_Filtered_stat/fastqc


for file in ${IN_PATH}/*.bz2 ;do
    fastqc ${file} -o ${OUT_PATH}
done
exit



