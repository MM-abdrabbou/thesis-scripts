library(tidyverse)
library(here)
library(reshape2)
library(ggforce)
#read the two dataframes
statFrame1 <- read.csv("/media/rna/INIA/benchmark/Alignment/BWA/alignFrame100_BWA.csv")
names(statFrame1)[names(statFrame1) == "X1"] <- "sample"

statFrame2 <- read.csv("/media/rna/INIA/benchmark/Alignment/Bowtie2/alignFrame100_Bowtie2.csv")
names(statFrame1)[names(statFrame1) == "X1"] <- "sample"



#for BWA mem
relFrame1 <- statFrame1 %>%
  select(sequences, reads_mapped, reads_mapped_and_paired, reads_properly_paired) %>%
  transmute(mapped = reads_mapped / sequences,
            mapped_and_paired = reads_mapped_and_paired / sequences,
            properly_paired = reads_properly_paired / sequences) %>%
  mutate(mapped_avg = 100 * mean(mapped),
         mapped_and_paired_avg = 100 * mean(mapped_and_paired),
         properly_paired_avg = 100 * mean(properly_paired))

# Extracting only plotting-relevant information
relNorm1 <- relFrame1 %>%
  select(mapped, mapped_and_paired, properly_paired)
# Creating long format for plotting
relLong1 <- melt(relNorm1, value.name = "Class")
apply(relNorm1, 2, mean)


#for bowtie2
relFrame2 <- statFrame2 %>%
  select(sequences, reads_mapped, reads_mapped_and_paired, reads_properly_paired) %>%
  transmute(mapped = reads_mapped / sequences,
            mapped_and_paired = reads_mapped_and_paired / sequences,
            properly_paired = reads_properly_paired / sequences) %>%
  mutate(mapped_avg = 100 * mean(mapped),
         mapped_and_paired_avg = 100 * mean(mapped_and_paired),
         properly_paired_avg = 100 * mean(properly_paired))

# Extracting only plotting-relevant information
relNorm2 <- relFrame2 %>%
  select(mapped, mapped_and_paired, properly_paired)
# Creating long format for plotting
relLong2 <- melt(relNorm2, value.name = "Class")
apply(relNorm2, 2, mean)

# Create a violin plot
aligner_stats <- ggplot(data = relLong1, aes(x = variable, y = 100*Class)) +
  geom_violin(position = position_dodge(width = 0.5), fill = "#66CCCC", trim = FALSE) +
  geom_boxplot(position = position_dodge(width = 0.5), fill = "#66CCCC", width = 0.1) +
  scale_x_discrete(breaks = c("mapped", "mapped_and_paired", "properly_paired"),
                   labels = c("Mapped", "Mapped and Paired", "Properly Paired"),
                   name = "Category") +
  scale_y_continuous(breaks = seq(65,100,2.5),
                     name = "Percentage of total reads") +
  scale_fill_brewer(palette = "Dark2",
                    labels = c("Bowtie2", "bwa-mem")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 0.8))

# Saving the plot
ggsave(filename = "alignment_stats_Common100_Bowtie2.png",
       path = "/media/rna/INIA/benchmark/Alignment",
       plot = aligner_stats,
       device = "png",
       width = 25,
       height = 20,
       units = "cm"
)

# Statistical analysis ----
# Average percentage of reads that are mapped
mean(statFrame2$reads_mapped / statFrame2$raw_total_sequences) * 100
sum(statFrame1$reads_mapped)
# Average percentage of reads that are mapped and paired
mean(statFrame2$reads_mapped_and_paired / statFrame2$raw_total_sequences) * 100
sum(statFrame2$reads_mapped_and_paired)
# Average percentage of reads that are mapped and properly paired
mean(statFrame2$reads_properly_paired / statFrame2$raw_total_sequences) * 100
# Average percentage of reads that are unmapped
mean(statFrame1$reads_unmapped / statFrame1$raw_total_sequences) * 100
# Average percentage of secondary reads
mean(statFrame$nonprimary_alignments / statFrame$raw_total_sequences) * 100
# Average percentage of supplementary reads
mean(statFrame2$supplementary_alignments / statFrame2$raw_total_sequences) * 100


relFrame1$aligner <- 'BWA'
relFrame2$aligner <- 'Bowtie2'

relFrameBig <- rbind(relFrame1, relFrame2)
relNormBig <- relFrameBig %>%
  select(mapped, mapped_and_paired, properly_paired, aligner)
# Creating long format for plotting
relLongBig <- melt(relNormBig, value.name = "Class")
apply(relNormBig, 2, mean)


ggplot(data = relLongBig, aes(x = variable, y = 100*Class, fill = aligner)) +
  geom_violin(position = position_dodge(width = 0.5), trim = FALSE) +
  geom_boxplot(position = position_dodge(width = 0.5), width = 0.1) +
  scale_x_discrete(breaks = c("mapped", "mapped_and_paired", "properly_paired"),
                   labels = c("Mapped", "Mapped and Paired", "Properly Paired"),
                   name = "Category") +
  scale_y_continuous(breaks = seq(60,100,2.5),
                     name = "Percentage of total reads", ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust = 0.8,size = 12,face="bold"),
        axis.text.y = element_text(size = 12,face="bold"),
        axis.title.y = element_text(size = 12,face="bold"),
        axis.title.x = element_text(size = 12,face="bold"))
  theme_bw() +
 

#ggplot(data = relLongBig, aes(x = variable, y = 100*Class)) +
 # geom_violin(position = position_dodge(width = 0.5), trim = FALSE) +
  #geom_boxplot(position = position_dodge(width = 0.5), width = 0.1) + 
  #facet_grid(. ~ aligner)