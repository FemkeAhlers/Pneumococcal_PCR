#########################################################################################################################
# Supplementary Figure 3: Description of the non-pneumococcal Streptococcus (NPS) species genome dataset (n=1,825).     #
# (A) Frequency of each of the 55 different bacterial species. (B) Distribution of the number of contigs per NPS genome.#
# (C) Distribution of the N50 values of the genome dataset.                                                             #
#########################################################################################################################


#Import dataframes

NPS_DE =read.csv("Fig1_NPS/data_export.csv") #Provenance fields
NPS_SE =read.csv("Fig1_NPS/Seq_bin.csv") #Sequence bin export with data quality control


#Create Supplementary Figure 3

NPS_species <- ggplot(NPS_DE, aes(x=(fct_rev(fct_infreq(species))))) +
  geom_bar(color="#4C9A2A", fill = "#76BA1B") +
    xlab("Species") +
  ylab("Count") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,220)) +
  theme(axis.title.x=element_blank()) + 
  ylab("Count") +
  theme(text=element_text(size=12)) +
#Add labels to the count
  geom_text(stat='count', aes(label=..count..), size = 3.5, hjust=-0.2) +
  theme(axis.text.y = element_text(size=10, face = "italic")) +
     coord_flip()

NPS_contigs <- ggplot(NPS_SE, aes(x= Contigs)) +
  geom_histogram(color="#4C9A2A", fill = "#76BA1B") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,500)) +
  xlab("Number of Contigs") + 
  ylab("Count") +
  theme(text=element_text(size=12))

NPS_N50 <- ggplot(NPS_SE, aes(x=N50)) +
  geom_histogram(color="#4C9A2A", fill = "#76BA1B") +
  theme_bw() +
  #forcing origin to start at (0,0) 
  scale_y_continuous(expand = c(0, 0), limits=c(0,700)) +
  xlab("N50") + 
  ylab("Count") +
  theme(text=element_text(size=12))

right_column <- plot_grid(NPS_contigs, NPS_N50, ncol =1, nrow =2)
Suppl_3 <- plot_grid(NPS_species, right_column, ncol =2, nrow =1,rel_widths = c(2,1) )

