#########################################################################################################################
# Supplementary Figure 1: Distribution of serotypes for the in silico pneumococcal study dataset (n=7,547).             #
#########################################################################################################################


#Load R libraries

library(dataRetrieval)
library(dplyr) 
library(tidyr) 
library(ggplot2)
library(extrafont)
library(forcats)
loadfonts(device = "win")
windowsFonts("Arial" = windowsFont("Arial"))

#Import dataframe

pneumo_DE =read.csv("Fig1_pneumo/data_export.csv") #Provenance fields
pneumo_SE =read.csv("Fig1_pneumo/seq_bin.csv") #Sequence bin export with data quality control 

#Create Supplementary Figure 1 

ggplot(pneumo_DE, aes(x= fct_rev(fct_infreq(serotype)))) +
  geom_bar(color="#4B9CD3", fill = "lightblue") +
  theme_bw() + 
  theme(axis.title.y=element_blank()) +
  coord_flip() +
  scale_y_continuous(expand = c(0, 0), limits = c(0,1100)) +
  ylab("Count") +
  theme(text=element_text(size=12)) +
  theme(axis.text = element_text(size = 10)) + 
  geom_text(stat='count', aes(label=..count..), size = 3.5, hjust=-0.2)  



