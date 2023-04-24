#!/bin/bash

###################################################
#                                                 #
#             Filter for quality and depth          #
#                                                 #
###################################################

# path of input vcf files
PATH_IN=' '
# Path for output filtered files
PATH_OUT=' '
file= ' '


bcftools view -e 'QUAL <= 30' /$PATH_IN/$file   -o /PATH_OUT/output_qual.vcf

bcftools view -e 'INFO/DP <= 60' /$PATH_IN/output_qual.vcf  -o /PATH_OUT/output_qual_dp.vcf
