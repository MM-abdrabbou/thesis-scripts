library(UpSetR)

#total <- as.data.frame.matrix(read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/pos/total.csv",sep = ',',header = TRUE))

bcftools_bowtie2 <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/bcftools_bowtie2.csv")
bcftools_bowtie2 <- bcftools_bowtie2$V1

bcftools_bwa <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/bcftools_bwa.csv")
bcftools_bwa <- bcftools_bwa$V1

freebayes_bwa <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/freebayes_bwa.csv")
freebayes_bwa <- freebayes_bwa$V1

gatk_bwa <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/gatk4_bwa.csv")
gatk_bwa <- gatk_bwa$V1

gatk_bowtie2 <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/gatk4_bowtie2.csv")
gatk_bowtie2 <- gatk_bowtie2$V1

octopus_bwa <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/octopus_bwa.csv")
octopus_bwa <- octopus_bwa$V1

octopus_bowtie2 <- read.table("/media/rna/INIA/benchmark/Concordance/upsetplot/Full_filteration/bi_allelic_pos/octopus_bowtie2.csv")
octopus_bowtie2 <- octopus_bowtie2$V1
#total <- read.csv("/media/rna/INIA/benchmark/Concordance/upsetplot/pos/total.csv",header = T, sep = ",")
set.seed(1000000)
var_list=list(BCFtools_Bowtie2 = bcftools_bowtie2,
              BCFtools_BWA_mem = bcftools_bwa,
              FreeBayes_BWA_mem = freebayes_bwa, 
                   GATK4_BWA_mem = gatk_bwa,
                   GATK4_Bowtie2 = gatk_bowtie2,
                   Octopus_BWA_mem = octopus_bwa,
                   Octopus_Bowtie2 = octopus_bowtie2)


text_scale_options1 <- c(1, 1, 1, 1, 0.75, 1)
text_scale_options2 <- c(1.3, 1.3, 1, 1, 2, 0.75)
text_scale_options3 <- c(1.5, 1.25, 1.25, 1, 2, 1.5)

main_bar_col <- c("violetred4")
sets_bar_col <- c("turquoise4")
matrix_col <- c("slateblue4")
shade_col <- c("wheat4")

mb_ratio1 <- c(0.55,0.45)
mb.ratio = mb_ratio1
x <- UpSetR::upset(fromList(var_list), order.by = 'degree', nsets = 7, nintersects=NA)
UpSetR::upset(fromList(var_list), order.by = 'freq', nsets = 7, nintersects=40)
#show.numbers=TRUE
#upset(fromList(var_list),intersections = TRUE)
UpSetR::upset(fromList(var_list), order.by = 'freq', nsets = 7, nintersects=40,
              mainbar.y.label = "Number of SNPs per intersection",
              sets.x.label = "Number of SNPs per caller [100,000]", 
              mb.ratio = mb_ratio1,
              show.numbers=TRUE,
              point.size = 2,
              line.size = 1,
              text.scale=text_scale_options3,
              main.bar.color = main_bar_col,
              sets.bar.color = sets_bar_col,
              matrix.color = matrix_col,
              shade.color = shade_col)

UpSetR::upset(fromList(var_list), order.by = 'freq', nsets = 7, nintersects=20,
              mainbar.y.label = "Number of SNPs per intersection",
              sets.x.label = "Number of SNPs per caller [100,000]", 
              mb.ratio = mb_ratio1,
              number.angles=45,
              point.size = 2,
              line.size = 1,
              text.scale=text_scale_options3,
              main.bar.color = main_bar_col,
              sets.bar.color = sets_bar_col,
              matrix.color = matrix_col,
              shade.color = shade_col)


#find unique number of intersections
x <- UpSetR::upset(fromList(var_list), order.by = 'freq', nsets = 7, nintersects=40)

nrow(unique(x$New_data))
