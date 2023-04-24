#!/usr/bin/env python
# coding: utf-8

# This python script combines the alignment statistics of the 100 samples in one data frame

#%% Import the modules


import re
import os
import subprocess
import numpy as np
import pandas as pd
from pprint import pprint
import numpy as np
import math

#%% # Defining the function 'getFilePath' to get the paths of all desired files

def getFilePath(path = '', inFile = 'err-r.txt', depth = 8):
    '''
    This function takes a path, removes the "here" path from it and returns a list containing the 
    absolute path of all output files within that path. The relative path of the folder containing the sample's
    statistics folders, the name of the final input file to be parsed as well as the depth of the root have to be specified
    in that order positionally or via their parameter names
    '''
    # Extracting aligner from path to extract correct stats file later
    pathList = []
    for root, subfolder, file in os.walk(path):
        # Excluding the "here" path ('.'). It is important to not execute the script from a path with
        # different relative distance to the target path to not fail expected path depth
        if root.count(os.sep) == depth:
            # Concatenating the sample paths and the samtools stats output file
            pathList.append(os.path.join(os.path.abspath(root), inFile))
    return pathList


#%% Define the function for the summary data frame creation and filling

def sumFrameAlign(inPath='', inFile='stats_stats.out', depth=8):
    #############################
    #                           #
    # Creating empty data frame #
    #                           #
    #############################
    #global statFrame
    inPath = inPath
    inFile = inFile
    depth = depth
    
    #path = "../../results/GBS1/alignment"
    #inFile = "stats_stats.out"
    #depth = 5
    fileList = getFilePath(path = inPath, inFile = inFile, depth = depth)
    # Initialize sample index list
    sampleList = []
    # Initialize column name list
    colNames = []

    # Looping over files and extracting summary statistics
    for file in fileList:
        # Extraction of sample name as for checking data frame entry validity
        sampleList.append(file.split('/')[-2])

        # Extracting summary statistics for each sample
        SN = subprocess.check_output(['grep ^SN {} | cut -f 2-'.format(file)], shell=True) # Extracting summary data for whole alignment
        SN = SN.decode('utf-8') # Decoding byte string into UTF-8 character string
        SN = SN.split('\n')
        for i in range(len(SN)):
            SN[i] = SN[i].split('\t')
        del(SN[-1])

        # Filling column name list (happens only in first loop)
        if len(colNames)==0:
            for i in range(len(SN)):
                # Extracting column names (also deleting leading and tailing white spaces and replacing spaces with underscores)
                colNames.append(SN[i][0])
                colNames[i] = re.sub(r"[^\w\s]", '', colNames[i])
                colNames[i] = colNames[i].strip()
                colNames[i] = re.sub(r"\s+", '_', colNames[i])

    # Creation of empty data frame
    statFrame = pd.DataFrame(index=sampleList, columns=colNames)
    print(statFrame)


    ##########################
    #                        #
    # Filling the data frame #
    #                        #
    ##########################

    # Looping over files and extracting summary statistics
    for i in range(len(fileList)):
        # Extraction of sample name as index identifier for filling in values
        sample = fileList[i].split('/')[-2]

        # Extracting summary statistics
        # bam mem alignment stat file summary
        bamSN = subprocess.check_output(['grep ^SN {} | cut -f 2-'.format(fileList[i])], shell=True) # Extracting summary data for whole alignment
        bamSN = bamSN.decode('utf-8') # Decoding byte string into UTF-8 character string
        bamSN = bamSN.split('\n')

        for i in range(len(bamSN)):
            bamSN[i] = bamSN[i].split('\t')
        del(bamSN[-1])

        # Extracting specific values 
        bamValArray = np.array([])
        for i in range(len(bamSN)):
            bamValArray = np.append(bamValArray, bamSN[i][1])

        # Filling in data frame
        statFrame.loc[sample] = bamValArray
    
    # Returning the statsFrame
    return statFrame


#%% Summing up the alignment statistics


alignFrame100 = sumFrameAlign(inPath = "/media/rna/INIA/benchmark/Alignment/Bowtie2/Alignment_stat", inFile = "stats_stats.out", depth = 8)

# In[45]:


##########################
#                        #
# Saving the data frame #
#                        #
##########################

# Save data frame to csv file for visualization in R
alignFrame100.to_csv('/media/rna/INIA/benchmark/Alignment/Bowtie2/alignFrame100.csv')


# In[ ]:





# ## Creation and filling of data frame for duplicate removed BAM files by looping over all stat files and extracting indices and sample names

# ## Defining the function 'samStatsDataFrame' to create a pandas Data Frame

# ## Extracting coverage data produced with MultiQC

# In[44]:


path = '/media/rna/INIA/Thesis Draft/Results/adapter_RE_trim/multiqc_data_after/multiqc_general_stats.txt'
absPath = os.path.abspath(path)
print(absPath)


# In[46]:


covFrame = pd.read_csv(absPath, delimiter='\t')
#covFrame = covFrame.iloc[::2]


# In[ ]:


list(covFrame.columns)


# In[67]:


covFrameSorted = covFrame.sort_values(by=[list(covFrame.columns)[4], list(covFrame.columns)[3]], ascending=True)


# In[68]:


covFrameSorted = covFrameSorted.drop(columns = ['FastQC_mqc-generalstats-fastqc-avg_sequence_length'])


# In[ ]:


covFrameSorted


# In[ ]:


np.mean(covFrameSorted['FastQC_mqc-generalstats-fastqc-total_sequences'])

