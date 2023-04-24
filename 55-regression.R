#This script perfroms the regression analysis on computational times of aligners


library('nortest')
library('tidyverse')


# check linear regression
time_m <- read.csv("/media/rna/INIA/benchmark/Scripts/Final_Analysis/computational_time/comp_All_Aligners.csv")
colnames(time_m)[colnames(time_m) == "Comp_time.s._BWA"] = "BWA"
colnames(time_m)[colnames(time_m) == "Comp_time.s._Bowtie2"] = "Bowtie2"

plot(time_m$raw_total_sequence, time_m$BWA, xlab = "reads", ylab = "time")

reg_lin_bwa = lm(time_m$BWA ~ time_m$raw_total_sequences )
reg_lin_b2 = lm(time_m$Bowtie2 ~ time_m$raw_total_sequences )
summary(reg_lin)
confint(reg_lin)

plot(reg_lin$residuals)
lillie.test(reg_lin$residuals)
qqnorm(reg_lin$residuals)

#predict confidence intervals for time taken by every aligner at individual samples
pred_bwa <- as.data.frame(predict(reg_lin_bwa, interval = 'prediction'))
#pred_bwa$aligner <- 'BWA'
pred_b2 <- as.data.frame(predict(reg_lin_b2, interval = 'prediction'))
#pred_b2$aligner <- 'Bowtie2'

# Merge data from both aligners in long format
time_pred_bwa <- cbind(time_long %>% filter(aligner == 'BWA'), pred_bwa)
time_pred_b2 <- cbind(time_long %>% filter(aligner == 'Bowtie2'), pred_b2)
time_long_all <- rbind(time_pred_bwa, time_pred_b2)

#test <- left_join(time_long, preds, by = 'aligner')

#new_data <- cbind(time_m, reg_lin_pred)

ggplot(data = new_data, aes(x = raw_total_sequences, y = Comp_time.s._BWA)) + 
  geom_point() +
  geom_smooth(method = 'lm') +
  geom_line(mapping = aes(x = raw_total_sequences, y = lwr), color = 'grey60',
            linetype = 'dashed') + 
  geom_line(mapping = aes(x = raw_total_sequences, y = upr), color = 'grey60',
            linetype = 'dashed') + 
  theme_minimal()

# plot the two aligners together in the same plot
ggplot(data = time_long_all, aes(x = raw_total_sequences, y = value, group_by = aligner)) + 
  geom_point(aes(col = aligner), size = 3) +
  geom_smooth(method = 'lm', color = 'black') +
  geom_line(mapping = aes(x = raw_total_sequences, y = lwr), color = 'grey60',
            linetype = 'dashed') + 
  geom_line(mapping = aes(x = raw_total_sequences, y = upr), color = 'grey60',
            linetype = 'dashed') + 
  scale_y_continuous(name = "Time Taken [s]") +
  scale_x_continuous(name = "Number of reads [million]") +
  theme_bw()



# variant callers
#read compt time file for callers
# Freebayes
ggplot(data = new_data, aes(x = raw_total_sequences, y = Comp_time.s._BWA)) + 
  geom_point() +
  geom_smooth(method = 'lm') +
  geom_line(mapping = aes(x = raw_total_sequences, y = lwr), color = 'grey60',
            linetype = 'dashed') + 
  geom_line(mapping = aes(x = raw_total_sequences, y = upr), color = 'grey60',
            linetype = 'dashed') + 
  theme_minimal()

#BCFtools

#GATK4

#Octopus 

