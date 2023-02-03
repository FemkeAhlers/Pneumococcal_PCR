# Figure 2A

library(ggplot2)
library(ComplexUpset) 
library(patchwork)
library(scales)
library(colorspace)
library(testthat)
library(knitr)
library(rmarkdown)
library(covr)
library(tibble)
library(vdiffr)
library(jsonlite)
library(data.table)
library(UpSetR)
library(dplyr)


SP_Upset2 =read.csv("Manuscript/Fig1_matrix/pneumo_456.csv")

#Subsetting the dataframe
targets = colnames(SP_Upset2[3:13])
#Reorder rows of the plot (second argument in upset command)
targets= c("Xisco3","Xisco2", "Xisco1",  "SP2020new", "Xisco", "SP2020old", "Spn9802", "psaA", "ply", "piaB", "lytA")

#Changing numeric value into boolean (i.e. 0/1 to FALSE/TRUE)
SP_Upset2[targets] = SP_Upset2[targets] ==1

#Drop the ID column
data <- SP_Upset2 %>% select(-id)


pdf("Fig2A_pneumo_Jan2023.pdf", width = 11, height = 6)
upset(data, 
      targets,
      #Define the order of the rows through the previously defined targets =c(list)
      sort_set=FALSE,
      #Changing the font size
      themes=upset_default_themes(text=element_text(size=12)),
      #Removing the set_size part of the plot following Angela's comments 03-11-2022
      set_sizes=FALSE, 
      #Removing the extra white space between y-axis and first bar
      width_ratio=0.1,
      #Making the matrix larger compared to the bargraph
      height_ratio=0.5,
      base_annotations = list(
        "Intersection size" = (
          intersection_size()
          + ylim(c(0,240)) 
          + ylab ("In silico study dataset false negatives")
          )
      ),
      #Removing vertical black lines between dots
      matrix=(
        intersection_matrix( 
            segment=geom_segment(
                linetype= "dotted", size=0, width=0, length=0)
            ))
      #Making the true negative circles white
      + scale_color_manual(
            values=c('TRUE'='Black', 'FALSE'='white'),
            labels=c('TRUE'='False positive', 'FALSE'='True negative'),
            breaks=c('TRUE', 'FALSE'),
            name='In silico results'
        )
      )
dev.off()


## Figure 2B 

# Making NPS in silico results Fig2B using Complex Upset

library(ComplexUpset) 
library(ggplot2)

NPS_Upset_2 =read.csv("Manuscript/Fig2_NPS_matrix/NPS_87.csv")

#Reorder rows of the plot (second argument in upset command)
NPS_Upset_3 <- NPS_Upset_2[, c(1, 6, 5, 4, 2, 3, 8, 7, 9, 10, 11, 12, 13)] 
targets_2 = colnames(NPS_Upset_3[2:12])
targets_2

#Changing numeric value into boolean (i.e. 0/1 to FALSE/TRUE)
NPS_Upset_2[targets_2] = NPS_Upset_2[targets_2] ==1

head(NPS_Upset_2)

head(NPS_Upset_3)


#Colour by species

pdf("FIG2B_NPS_Jan2023.pdf", width = 11, height = 6)
upset(NPS_Upset_3, 
      targets_2,
      #Define the order of the rows through the previously defined targets =c(list)
      sort_set=FALSE,
      #Changing the font size
      themes=upset_default_themes(text=element_text(size=12)),
      #Removing the set_size part of the plot following Angela's comments 03-11-2022
      set_sizes=FALSE, 
      #Removing the extra white space between y-axis and first bar
      width_ratio=0.1,
      #Making the matrix larger compared to the bargraph
      height_ratio=0.5,
      #Colouring by species
      base_annotations = list(
        "Intersection size" = (
          intersection_size(count=TRUE, mapping=aes(fill=Species))
          #Changing the colours of the species
          + scale_fill_manual(values = c("#138808", "#A7F432"))
          + ylim(c(0,65)) 
          + ylab("In silico NPS dataset false positives") 
          )
        ), 
      #Removing vertical black lines between dots
      matrix=(
        intersection_matrix( 
            segment=geom_segment(
                linetype= "dotted", size=0, width=0, length=0)
            ))
      #Making the true negative circles white
      + scale_color_manual(
            values=c('TRUE'='Black', 'FALSE'='white'),
            labels=c('TRUE'='False positive', 'FALSE'='True negative'),
            breaks=c('TRUE', 'FALSE'),
            name='In silico results'
        )
      )
dev.off()





