# We have a bruker D2 phaser instrument from which we export the data as .xy format 
# Put the exported XRD data (.xy files) in the same directory as the script and go on
setwd("C:/Users/Ali/Desktop/XRD plotting") #directory name has to be adjusted (https://youtu.be/zyAFFsUkXec?t=47)
# We have a bruker D2 phaser instrument from which we export the data as .xy format 
# Put the exported XRD data (.xy files) in the same directory as the script and go on
library(tidyverse)
library(ggplot2)
XRDdata <- read.csv('BAM1C-R_exported.xy', sep=' ') #Here the name of my file was "BAM1C-R_exported.xy". ".xy" has to be in the end of the name in the script.
head(XRDdata)
XRDdata2<- filter(XRDdata, X.Id.>=10 & X.Id.<=90) # I only want to plot the data in the 10-90 2 theta range
head(XRDdata2)
ggplot(XRDdata2, aes(x=`X.Id.`, y=`X`)) +
  geom_line(colour="navy", size= 1)+ 
  ylim(0,100) + #feel free to play with the y scale
  scale_x_continuous(breaks = c(10 ,20, 30, 40, 50, 60, 70, 80, 90))+
  xlab("2?? (Degree)") + ylab("Intensity (a.u.)") + 
  
  theme_bw() +  #There could be problems with saving the Greek character Theta ?? 
  theme(panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())+
  theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())+
  theme(axis.ticks.y = element_blank())+ #warnings are only about finding fonts in some databases (There is no problem)
  theme(
    axis.title.x = element_text(size = 14),
    axis.text.x = element_text(size = 12, face="bold", colour = "black"),
    axis.title.y = element_text(size = 14),
    axis.text.y = element_blank())

