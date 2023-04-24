#!/bin/bash


# This script uses genomic DBImport from GATK4 to merge GVCF files generated from BWA-mem BAM files


#PATH_IN_VCF=/media/rna/INIA/benchmark/Variant_calling/gatk/bwa_gvcf_nnsamples
PATH_OUT=/media/rna/INIA/benchmark/VCF_Filteration/Gatk4/bwa
reference=/media/rna/INIA/benchmark/Variant_calling/gatk/Reference/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa
#mkdir -p $PATH_OUT


cd /media/rna/INIA/benchmark/Variant_calling/gatk/bwa_gvcf_nnsamples
#for f in *.vcf; do   bgzip "$f"; done
#for f in *.gz ; do tabix -p vcf $f ; done
#for entry in *.gz; do echo $entry; done

# Attempts to use rtg tools, bcftools merge, GATK4 mergeVCFs and GATK4 combineGVCFs didn't work.
#/home/rna/benchmark/rtg-tools/rtg-tools-3.12.1-32d4c2d2/rtg vcfmerge -I /media/rna/INIA/benchmark/Variant_calling/BCF_Tools/bwa-mem/files_names.txt -F -o $PATH_OUT/bcftools_bwa_rtg.vcf.gz
#bcftools merge  -l /media/rna/INIA/benchmark/files_names.txt --force-samples -o $PATH_OUT/gatk4_bwa_bcfmerge.vcf.gz
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk MergeVcfs -I /media/rna/INIA/benchmark/files_names.txt -O $PATH_OUT/gatk4_bwa_bcfmerge.vcf.gz
#for sample in *vcf.gz ; do
#/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk CombineGVCFs \
#done

#bcftools view -h P1-A01-001-AD.vcf.gz | grep TAG
/media/rna/INIA/benchmark/Variant_calling/gatk/gatk-4.2.5.0/gatk GenomicsDBImport \
-R $reference \
-V P1-A01-001-AD.g.vcf.gz \
-V P1-A02-009-AV.g.vcf.gz \
-V P1-A05-033-CO.g.vcf.gz \
-V P1-A06-041-DY.g.vcf.gz \
-V P1-A07-049-DK.g.vcf.gz \
-V P1-A09-065-CQ.g.vcf.gz \
-V P1-A10-073-MM.g.vcf.gz \
-V P1-B03-018-BL.g.vcf.gz \
-V P1-B04-026-CY.g.vcf.gz \
-V P1-B05-034-CU.g.vcf.gz \
-V P1-B07-050-GL.g.vcf.gz \
-V P1-B12-090-SI.g.vcf.gz \
-V P1-C02-011-AA.g.vcf.gz \
-V P1-C03-019-B03.g.vcf.gz \
-V P1-C04-027-CL.g.vcf.gz \
-V P1-C05-035-DA.g.vcf.gz \
-V P1-C06-043-EM.g.vcf.gz \
-V P1-C07-051-GW.g.vcf.gz \
-V P1-C08-059-JZ.g.vcf.gz \
-V P1-C09-067-MU.g.vcf.gz \
-V P1-C10-075-MZ.g.vcf.gz \
-V P1-D05-036-DR.g.vcf.gz \
-V P1-D06-044-FU.g.vcf.gz \
-V P1-D09-068-MR.g.vcf.gz \
-V P1-D12-092-SU.g.vcf.gz \
-V P1-E03-021-BT.g.vcf.gz \
-V P1-E05-037-DB.g.vcf.gz \
-V P1-E06-045-AG.g.vcf.gz \
-V P1-E08-061-DO.g.vcf.gz \
-V P1-E09-069-MP.g.vcf.gz \
-V P1-E10-077-PD.g.vcf.gz \
-V P1-E12-093-SR.g.vcf.gz \
-V P1-F01-006-AO.g.vcf.gz \
-V P1-F02-014-AT.g.vcf.gz \
-V P1-F03-022-BO.g.vcf.gz \
-V P1-F06-046-FE.g.vcf.gz \
-V P1-F11-086-SG.g.vcf.gz \
-V P1-G01-007-AH.g.vcf.gz \
-V P1-G03-023-CA.g.vcf.gz \
-V P1-G04-031-CK.g.vcf.gz \
-V P1-G05-039-DI.g.vcf.gz \
-V P1-G11-087-SA.g.vcf.gz \
-V P1-H05-040-DF.g.vcf.gz \
-V P1-H06-048-FN.g.vcf.gz \
-V P1-H08-064-LV.g.vcf.gz \
-V P1-H11-088-ST.g.vcf.gz \
-V P1-H12-096-TY.g.vcf.gz \
-V P2-A01-097-VN.g.vcf.gz \
-V P2-A02-105-AM.g.vcf.gz \
-V P2-A06-139-LS.g.vcf.gz \
-V P2-A07-149-PA.g.vcf.gz \
-V P2-A08-157-RN.g.vcf.gz \
-V P2-A09-167-TL.g.vcf.gz \
-V P2-A10-175-SY.g.vcf.gz \
-V P2-A12-191-LI.g.vcf.gz \
-V P2-B01-098-VY.g.vcf.gz \
-V P2-B02-106-AM.g.vcf.gz \
-V P2-B06-140-Li.g.vcf.gz \
-V P2-B07-150-PV.g.vcf.gz \
-V P2-B10-176-MO.g.vcf.gz \
-V P2-B12-192-RB.g.vcf.gz \
-V P2-C01-099-VR.g.vcf.gz \
-V P2-C03-115-ED.g.vcf.gz \
-V P2-C05-133-KG.g.vcf.gz \
-V P2-C06-142-MI.g.vcf.gz \
-V P2-C07-151-PO.g.vcf.gz \
-V P2-C10-177-TO.g.vcf.gz \
-V P2-D01-100-YU.g.vcf.gz \
-V P2-D03-116-FS.g.vcf.gz \
-V P2-D04-125-HY.g.vcf.gz \
-V P2-D05-134-KN.g.vcf.gz \
-V P2-D07-152-PR.g.vcf.gz \
-V P2-D09-170-VG.g.vcf.gz \
-V P2-E01-101-ZA.g.vcf.gz \
-V P2-E07-153-RE.g.vcf.gz \
-V P2-E09-171-WE.g.vcf.gz \
-V P2-E12-197-LP.g.vcf.gz \
-V P2-F03-118-FK.g.vcf.gz \
-V P2-F04-127-IK.g.vcf.gz \
-V P2-F05-136-KS.g.vcf.gz \
-V P2-F06-145-NI.g.vcf.gz \
-V P2-F08-164-SO.g.vcf.gz \
-V P2-F09-172-DE.g.vcf.gz \
-V P2-F12-172-DE.g.vcf.gz \
-V P2-G02-111-CT.g.vcf.gz \
-V P2-G03-119-FI.g.vcf.gz \
-V P2-G04-128-JA.g.vcf.gz \
-V P2-G07-155-RT.g.vcf.gz \
-V P2-G09-173-SO.g.vcf.gz \
-V P2-G12-173-SO.g.vcf.gz \
-V P2-H01-104-AK.g.vcf.gz \
-V P2-H03-121-FG.g.vcf.gz \
-V P2-H04-129-KA.g.vcf.gz \
-V P2-H05-138-L1.g.vcf.gz \
-V P2-H06-148-OL.g.vcf.gz \
-V P2-H07-156-RL.g.vcf.gz \
-V P2-H08-166-TN.g.vcf.gz \
-V P2-H10-182-AS.g.vcf.gz \
-V P2-H11-190-LR.g.vcf.gz \
-V P2-H12-179-AG.g.vcf.gz \
-L /media/rna/INIA/benchmark/intervals.list \
--genomicsdb-workspace-path $PATH_OUT

