#!/bin/bash


###################################################
#                                                 #
# Perform bbduk filteration on raw reads          #
#                                                 #
###################################################
cd /media/rna/INIA/benchmark/Raw_Data

##bbduk version 38.86
for i in * ;do
filename=$(echo ${i})
file=${filename}
sample=${file:7:20}

#Trimming of right end

bbduk\
 in=./${file}/${sample}_R1.fastq.bz2\
 in2=./${file}/${sample}_R2.fastq.bz2\
 out=../Data_Filtered/${sample}_R1_trimR.fastq.bz2\
 out2=../Data_Filtered/${sample}_R2_trimR.fastq.bz2\
 ref=/home/rna/Downloads/bbmap/resources/adapters.fa
 ktrim=r\
 k=23\
 mink=11\
 hdist=1\
 threads=11
 


#Trimming of left end

bbduk\
 in=../Data_Filtered/${sample}_R1_trimR.fastq.bz2\
 in2=../Data_Filtered/${sample}_R2_trimR.fastq.bz2\
 out=../Data_Filtered/${sample}_R1_trimRL.fastq.bz2\
 out2=../Data_Filtered/${sample}_R2_trimRL.fastq.bz2\
 ref=/home/rna/Downloads/bbmap/resources/adapters.fa
 ktrim=l\
 k=23\
 mink=11\
 hdist=1\
 threads=11


#Base Trimming, Quality filtiering, length filtering
bbduk\
 in=../Data_Filtered/${sample}_R1_trimRL.fastq.bz2\
 in2=../Data_Filtered/${sample}_R2_trimRL.fastq.bz2\
 out=../Data_Filtered/${sample}_R1_qualtrim.fastq.bz2\
 out2=../Data_Filtered/${sample}_R2_qualtrim.fastq.bz2\
 qtrim=rl\
 trimq=30\
 minlen=35\
 stats=../Data_Filtered/${sample}_stats_qualtrim.txt \
 > ../Data_Filtered/${sample}_out_qualtrim.txt\
 2> ../Data_Filtered/${sample}_err_qualtrim.txt\
 threads=11;


done


exit
