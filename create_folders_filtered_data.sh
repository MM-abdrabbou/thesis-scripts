 #!/bin/bash
cd /media/rna/INIA/benchmark/Data_Filtered
for i in * ;do
filename=$(echo ${i})
file=${filename}
sample=${file::13}
 mkdir -p ./$sample
mv ./$file -t ./$sample
 
done
exit 