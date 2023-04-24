#!/bin/bash

cd /media/rna/INIA/benchmark/Raw_Data

for i in * ;do
    filename=$(echo ${i})
    file=${filename}
    sample=${file:7:20}
    cp ./${file}/${sample}_R1_fastqc.zip  ./${file}/${sample}_R2_fastqc.zip  /media/rna/INIA/benchmark/Raw_Data_Fastqc
done
exit
