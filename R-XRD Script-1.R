setwd("C:/Users/Ali/Desktop/New folder")
library(tidyverse)
library(ggplot2)
library(dplyr)
  a1 <-read.csv("AN05P56-water_exported.xy", header=FALSE, sep = " ")
head(a1)
b1 <-   a1 %>% slice(2:nrow(a1))
head(b1)
c1 <-   b1[1:2]
    head(c1)
       sapply(c1,class)
         c1$V1 <- as.numeric(as.character(c1$V1))
       sapply(c1,class)
    head(c1)

    
    #filtering data between 15- 90
filter(c1, V1 >= 20)
head(c1)

# normalization of y axis between 0 , 100




 ggplot(c1, aes(V1, V2))+
  geom_line(colour="navy", size= 0.25) +

 ylim(0,25) + #feel free to play with the y scale
   scale_x_continuous(breaks = c(10 ,20, 30, 40, 50, 60, 70, 80, 90))+
   xlab("2Theta (Degree)") + ylab("Intensity (a.u.)") + 
   
   theme_bw() +  #There could be problems with saving the Greek character Theta ?? 
   theme(panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())+
   theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())+
   theme(axis.ticks.y = element_blank())+ #warnings are only about finding fonts in some databases (There is no problem)
   theme(
     axis.title.x = element_text(size = 14),
     axis.text.x = element_text(size = 12, face="bold", colour = "black"),
     axis.title.y = element_text(size = 14),
     axis.text.y = element_blank())
 