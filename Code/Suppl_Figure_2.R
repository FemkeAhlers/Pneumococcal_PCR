# Supplementary Figure 2: Genome quality data for the in silico pneumococcal study dataset (n=7,547). 

#Load R libraries

library(dataRetrieval)
library(dplyr) 
library(tidyr) 
library(ggplot2)
library(extrafont)
library(cowplot)
library(forcats)
loadfonts(device = "win")
windowsFonts("Arial" = windowsFont("Arial"))

#Import dataframe

pneumo_DE =read.csv("Fig1_pneumo/data_export.csv") #Provenance fields
pneumo_SE =read.csv("Fig1_pneumo/seq_bin.csv") #Sequence bin export with data quality control 

#Create Supplementary Figure 2

#Distribution of contigs
contigs <- ggplot(pneumo_SE, aes(x= Contigs)) +
  geom_histogram(color="#4B9CD3", fill = "lightblue") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,1300)) +
  xlab("Number of Contigs") + ylab("Count") +
  theme(text=element_text(size=12))

length <- ggplot(pneumo_SE, aes(x= Total.length)) +
  geom_histogram(color="#4B9CD3", fill = "lightblue") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,1000)) +
  xlab("Genome length (bp)") + ylab("Count") +
  theme(text=element_text(size=12))

GC <- ggplot(pneumo_SE, aes(x=X.GC)) +
  geom_histogram(color="#4B9CD3", fill = "lightblue") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,3500)) +
  xlab("%GC") + ylab("Count") +
  theme(text=element_text(size=12))

N50 <- ggplot(pneumo_SE, aes(x=N50)) +
  geom_histogram(color="#4B9CD3", fill = "lightblue") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,4000)) +
  xlab("N50") + ylab("Count") +
  theme(text=element_text(size=12))


top_row <- plot_grid(contigs, length, ncol =2, nrow =1)
bottom_row <- plot_grid(N50, GC, ncol =2, nrow =1)
Suppl_2 <- plot_grid(top_row, bottom_row, ncol =1, nrow =2)

