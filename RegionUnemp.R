library(Hmisc)
library(dplyr)
library(ggplot2)

setwd("C:/Users/Laila/Desktop/Stage_PEmp")
dat <- read.csv("UnempRatesRegions2002-2012.csv", header=T, sep=";")

max(dat)

ggplot(dat, aes(x=Trimestre, y=Alsace)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Aquitaine)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  


ggplot(dat, aes(x=Trimestre, y=Auvergne)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Basse.Normandie)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Bourgogne)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Bretagne)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Centre)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Champagne.Ardenne)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Corse)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Franche.Comte)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Haute.Normandie)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=ile.de.France)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Languedoc.Roussillon)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Limousin)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Lorraine)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Midi.Pyrenees)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Nord.Pas.de.Calais)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Pays.de.la.Loire)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Picardie)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Poitou.Charentes)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  


ggplot(dat, aes(x=Trimestre, y=Provence.Alpes.Cote.d.Azur)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

ggplot(dat, aes(x=Trimestre, y=Rhone.Alpes)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  


f<- ggplot(dat, aes(x=Trimestre, y=France.metropolitaine)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

view(f)

ggplot(dat, aes(x=Trimestre, y=France.metropolitaine)) +
  geom_line()
