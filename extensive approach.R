library(Hmisc)
library(dplyr)
library(ggplot2)

# IMPORTING DATASET
###
setwd("C:/Users/Laila/Desktop/flux_completbis")
dat04 <- read.csv("flux2004.csv", header=T, sep=",")
dat05 <- read.csv("flux2005.csv", header=T, sep=",")
dat06 <- read.csv("flux2006.csv", header=T, sep=",")
dat08 <- read.csv("flux2008.csv", header=T, sep=",")
dat10 <- read.csv("flux2010.csv", header=T, sep=",")

#convert to a local data frame
dem04 <- tbl_df(dat04)
dem05 <- tbl_df(dat05)
dem06 <- tbl_df(dat06)
dem08 <- tbl_df(dat08)
dem10 <- tbl_df(dat10)

# censored data frequencies
x4 <- table(dem04$censur_ar1, dem04$duree_de_mois)
x5 <- table(dem05$censur_ar1, dem05$duree_de_mois)
x6 <- table(dem06$censur_ar1, dem06$duree_de_mois)
x8 <- table(dem08$censur_ar1, dem08$duree_de_mois)
x10 <- table(dem10$censur_ar1, dem10$duree_de_mois)

barplot(x4, beside = T, legend = T, xlab="Months of unemployment", ylab="Number of people censored or not", main="Distrib of censored data by unemp duration -2004")
dev.copy(png,'censur04.png')
dev.off()

barplot(x5, beside = T, legend = T, xlab="Months of unemployment", ylab="Number of people censored or not", main="Distrib of censored data by unemp duration -2005")
dev.copy(png,'censur05.png')
dev.off()

barplot(x6, beside = T, legend = T, xlab="Months of unemployment", ylab="Number of people censored or not", main="Distrib of censored data by unemp duration -2006")
dev.copy(png,'censur06.png')
dev.off()

barplot(x8, beside = T, legend = T, xlab="Months of unemployment", ylab="Number of people censored or not", main="Distrib of censored data by unemp duration -2008")
dev.copy(png,'censur08.png')
dev.off()

barplot(x10, beside = T, legend = T, xlab="Months of unemployment", ylab="Number of people censored or not", main="Distrib of censored data by unemp duration -2010")
dev.copy(png,'censur10.png')
dev.off()

# hour distribution of RA, for individuals who actually have a RA
newdata04 <- dem04[ which(dem04$nbheur_ar1 > 0), ]
newdata05 <- dem05[ which(dem05$nbheur_ar1 > 0), ]
newdata06 <- dem06[ which(dem06$nbheur_ar1 > 0), ]
newdata08 <- dem08[ which(dem08$nbheur_ar1 > 0), ]
newdata10 <- dem10[ which(dem10$nbheur_ar1 > 0), ]

y04 <- table(newdata04$nbheur_ar1)
barplot(y04, beside = T, legend = T, xlab="Hours worked in RA for 1st unemp month", ylab="Number of individuals", main="RA hour distrib for indivs, 1st unemp month -2004")
dev.copy(png,'hour04.png')
dev.off()

y06

y05 <- table(newdata05$nbheur_ar1)
barplot(y05, beside = T, legend = T, xlab="Hours worked in RA for 1st unemp month", ylab="Number of individuals", main="RA hour distrib for indivs, 1st unemp month -2005")
dev.copy(png,'hour05.png')
dev.off()

y06 <- table(newdata06$nbheur_ar1)
barplot(y06, beside = T, legend = T, xlab="Hours worked in RA for 1st unemp month", ylab="Number of individuals", main="RA hour distrib for indivs, 1st unemp month -2006")
dev.copy(png,'hour06.png')
dev.off()

y08 <- table(newdata08$nbheur_ar1)
barplot(y08, beside = T, legend = T, xlab="Hours worked in RA for 1st unemp month", ylab="Number of individuals", main="RA hour distrib for indivs, 1st unemp month -2008")
dev.copy(png,'hour08.png')
dev.off()

y10 <- table(newdata10$nbheur_ar1)
barplot(y10, beside = T, legend = T, xlab="Hours worked in RA for 1st unemp month", ylab="Number of individuals", main="RA hour distrib for indivs, 1st unemp month -2010")
dev.copy(png,'hour10.png')
dev.off()

