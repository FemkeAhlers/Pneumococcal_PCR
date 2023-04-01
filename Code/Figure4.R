#########################################################################################################################
# Figure 4: The relationship between experimental Cq-values for the 16S positive control and each of the four targets,  #
# when tested in multiplex assays against 248 UKHSA pneumococcal isolates that had been selected based upon             #
# in silico amplicon diversity. Note: data for Xisco_1, _2 and _3 were very similar so only Xisco_2 is shown here.      #
#########################################################################################################################

#Load R libraries
library(dataRetrieval)
library(dplyr) 
library(tidyr) 
library(ggplot2)
library(cowplot)
library(tibble)
library(ggh4x)

#Import dataframe
qPCR=read.csv("Figure4_df.csv")

#Create Figure 4
#Changing the Cq values to numeric values, removing the Undetermined values
qPCR$lytA <- as.numeric(qPCR$lytA)
qPCR$piaB_new <- as.numeric(qPCR$piaB_new)
qPCR$X16S_from_lytA_plate <- as.numeric(qPCR$X16S_from_lytA_plate)
qPCR$Xisco2 <- as.numeric(qPCR$Xisco2)
qPCR$X16S_from_Xisco2_plate <- as.numeric(qPCR$X16S_from_Xisco2_plate)
qPCR$SP2020_from_Xisco2_plate <- as.numeric(qPCR$SP2020_from_Xisco2_plate)


lytA <- ggplot(qPCR, aes(X16S_from_lytA_plate,lytA, color=lytA_colour)) +
  geom_point(alpha = 0.5, size =3) +
  xlim(15, 42) +
  ylim(15, 42) +
  ylab("Cq lytA") +
  xlab("Cq 16S positive control") +
  geom_hline(yintercept=35, linetype='dashed') +
  geom_vline(xintercept=35, linetype='dashed') +
  theme_bw() +
  theme(legend.position="none") +
  scale_color_manual(values=c("#1434A4", "#40E0D0"))

piaB <-ggplot(qPCR, aes(X16S_from_lytA_plate,piaB_new, color=piaB_colour)) +
  geom_point(alpha = 0.5, size =3) +
  xlim(15, 42) +
  ylim(15, 42) +
  ylab("Cq piaB") +
  xlab("Cq 16S positive control") +
  geom_hline(yintercept=35, linetype='dashed') +
  geom_vline(xintercept=35, linetype='dashed') +
  theme_bw() +
  theme(legend.position="none") +
  scale_color_manual(values=c("#1434A4", "#40E0D0"))

SP2020_2 <- ggplot(qPCR, aes(X16S_from_Xisco2_plate,SP2020_from_Xisco2_plate, color=SP2020_colour)) +
  geom_point(alpha = 0.5, size =3) +
  xlim(15, 42) +
  ylim(15, 42) +
  ylab("Cq SP2020 (multiplex with Xisco_2)") +
  xlab("Cq 16S positive control") +
  geom_hline(yintercept=35, linetype='dashed') +
  geom_vline(xintercept=35, linetype='dashed') +
  theme_bw() +
  theme(legend.position="none") +
  scale_color_manual(values=c("#1434A4", "#40E0D0"))

Xisco_2 <- ggplot(qPCR, aes(X16S_from_Xisco2_plate,Xisco2)) +
  geom_point(alpha = 0.5, size =3, colour="#40E0D0") +
  xlim(15, 42) +
  ylim(15, 42) +
  ylab("Cq Xisco_2") +
  xlab("Cq 16S positive control") +
  geom_hline(yintercept=35, linetype='dashed') +
  geom_vline(xintercept=35, linetype='dashed') +
  theme_bw() +
  theme(legend.position="none") +
  scale_color_manual(values=c("#40E0D0"))

Row_A <- plot_grid(Xisco_2, SP2020_2, labels=c("A", "B"))
Row_B <- plot_grid(lytA, piaB, labels = c("C", "D"))

Figure4 <-plot_grid(Row_A, Row_B, nrow =2)
