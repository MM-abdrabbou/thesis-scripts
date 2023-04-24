#!/bin/bash

# This code copies folders of 100 samples randomly from the 192 samples from the Data folder GBS1 into Benchmark Data folder.
find  /media/rna/INIA/GBS1/RAW/* -maxdepth 0 | sort -k1 | shuf -n100 | xargs cp -r -t  /media/rna/INIA/benchmark/Raw_Data


