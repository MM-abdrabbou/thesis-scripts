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


bcftools view -e 'QUAL <= 30' /$PATH_IN/$file   -o /PATH_IN/$output

bcftools view -e 'INFO/DP <= 60' /$PATH_IN/$file   -o /PATH_IN/$output
