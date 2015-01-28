library(Hmisc)
library(dplyr)
library(ggplot2)

setwd("C:/Users/Laila/Desktop/Stage_PEmp")
dat2 <- read.csv("2002-12UnempRegion2.csv", header=T, sep=";")



# evolution for France (national level)

## selecting observation based on values: we extract a subset where values of "Region" is
## "France metropolitaine"

frmetrop <- dat2[which(dat2$Region=="France metropolitaine"),]


ggplot(data=frmetrop, aes(x=row.names, y=UnempRate)) +
  geom_point() +
  geom_line() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Evolution of regional nemployment Rates in France (2002-2012) - INSEE data ") +
  labs(x="Date (in quarters)", y="Unemployment rate")
  

# Getting a representation with a continuous line:

frmetro2 <- read.csv("UnempRateFrance.csv", header=T, sep=";")

ggplot(data=frmetro2, aes(x=Order, y=UnempRate)) +
  geom_point() +
  geom_line() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Evolution of regional nemployment Rates in France (2002-2012) - INSEE data ") +
  labs(x="N-th quarter, (starting Q1 2002)", y="Unemployment rate")


# evolution for all regions (local level)

ggplot(data=dat2, aes(x=Date, y=UnempRate, group=Region, color=Region)) +
  geom_line() +
  geom_point() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Evolution of regional nemployment Rates in France (2002-2012) - INSEE data ") +
  labs(x="Date (in quarters)", y="Unemployment rate")



## in detail for each region
dat <- read.csv("UnempRatesRegions2002-2012.csv", header=T, sep=";")


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
g <-  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  


f<- ggplot(dat, aes(x=Trimestre, y=France.metropolitaine)) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, 15)  

###



