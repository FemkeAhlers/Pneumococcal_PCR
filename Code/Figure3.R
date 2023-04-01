#########################################################################################################################
# Figure 3: Limit of detection of Xisco_1, Xisco_2, Xisco_3 and SP2020_new singleplex assays.                           #
# (A) Representative results for one of the three dilution series, depicting qPCR curves coloured by pneumococcal copy  #
# number per well. Horizontal dashed lines indicate the fluorescence threshold at 0.1 dRn.                              #
# (B) A linear model fitted to the results for all three dilution series (24 data points in total),                     #
# with 95% confidence intervals in grey.                                                                                #
#########################################################################################################################


#Load R libraries
library(ggplot2)
library(magrittr)
library(dplyr)
library(ggpubr)

#Import dataframe
qPCR_singleplex_LOD = read.csv("19_12_2022_monoplex_LOD_curves_PCR_v2.csv")
qPCR_singleplex_eff = read.csv("19_12_2022_monoplex_efficiency_v3.csv"

#Create Figure 3A
qPCR_singleplex_LOD$CopyNumber <- factor(qPCR_singleplex_LOD$CopyNumber,
                              levels = c("87568", "8757", "876", "88", "9", "4", "2", "1"))

legend_title <- "Pneumococcal copy number"

#Making the y-axis log scale
qPCR_singleplex_LOD <-qPCR_singleplex_LOD %>% 
  mutate(Log_dRn = log10(dRn))

ggplot(data = qPCR_singleplex_LOD, aes(x=CycleNumber, y=Log_dRn, colour=CopyNumber)) +
    geom_line(size=1) +
    xlab("qPCR Cycles") +
    ylab("log10(dRn)") +
    ylim(-2,1) +
    xlim(15,40) +
    geom_hline(yintercept =-1, linetype='dashed') +
    theme_bw() +
    guides(colour = guide_legend(override.aes = list(size=3))) +
    facet_wrap(~Target, nrow=2, ncol=2) +
    theme(legend.position="bottom", legend.box = "horizontal") +
    guides(color = guide_legend(title = "Pneumococcal copy number", nrow=1)) 


#Create Figure 3B - calculating efficiency using the 3 runs for 4 singleplex assays 

#Making the x-axis log scale
qPCR_singleplex_eff <-qPCR_singleplex_eff%>% 
  mutate(Log_CopyNumber = log10(CopyNumber))


qPCR_singleplex_eff$CopyNumber <- factor(qPCR_singleplex_eff$CopyNumber,
                              levels = c("2", "4", "9", "88", "876", "8757", "87568"))

ggplot(data = qPCR_singleplex_eff, aes(x=Log_CopyNumber, y=Cq)) +
    geom_point(size=2) +
    xlab("Log pneumococcal DNA copy number") +
    ylab("Cq-value") +
    theme_bw() +
    geom_smooth(method = "lm", se=TRUE, size =0.5) +
    stat_regline_equation(label.y = 25, aes(label = ..eq.label..), coef.digits = 3) +
    facet_wrap(~Target, nrow=2, ncol=2)
