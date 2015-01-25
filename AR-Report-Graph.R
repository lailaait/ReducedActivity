library(Hmisc)
library(dplyr)
library(ggplot2)

# IMPORTING DATASET
###
setwd("C:/Users/Laila/Desktop/flux_complet")
#dat00 <- read.csv("flux2000.csv", header=T, sep=",")
#dat02 <- read.csv("flux2002.csv", header=T, sep=",")
#dat04 <- read.csv("flux2004.csv", header=T, sep=",")
#dat05 <- read.csv("flux2005.csv", header=T, sep=",")
#dat06 <- read.csv("flux2006.csv", header=T, sep=",")
#dat08 <- read.csv("flux2008.csv", header=T, sep=",")
#dat10 <- read.csv("flux2010.csv", header=T, sep=",")

#convert to a local data frame
dem00 <- tbl_df(dat00)
#dem02 <- tbl_df(dat02) 
#dem04 <- tbl_df(dat04)
#dem05 <- tbl_df(dat05)
#dem06 <- tbl_df(dat06)
#dem08 <- tbl_df(dat08)
#dem10 <- tbl_df(dat10)

#convert to a normal data frame to see all of the columns
#data.frame(head(dem))

## 1. REPARTITION PER GENDER AND PER AGE ON OVERALL SUBSET OF OBSERVATIONS

ggplot(dem00, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2000")
ggsave("1-GenderRepartition-2000.jpeg")

ggplot(dem02, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2002")
ggsave("1-GenderRepartition-2002.jpeg")

ggplot(dem04, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2004")
ggsave("1-GenderRepartition-2004.jpeg")

ggplot(dem05, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2005")
ggsave("1-GenderRepartition-2005.jpeg")

ggplot(dem06, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2006")
ggsave("1-GenderRepartition-2006.jpeg")

ggplot(dem08, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2008")
ggsave("1-GenderRepartition-2008.jpeg")

ggplot(dem10, aes(x=factor(SEXE))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Gender", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female")) +
  ggtitle("Distribution of each gender in the dataset in 2010")
ggsave("1-GenderRepartition-2010.jpeg")


ggplot(dem00, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2000")
ggsave("1.1-NationalityRepartition-2000.jpeg")

ggplot(dem02, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2002")
ggsave("1.1-NationalityRepartition-2002.jpeg")

ggplot(dem04, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2004")
ggsave("1.1-NationalityRepartition-2004.jpeg")


ggplot(dem04, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2004")
ggsave("1.1-NationalityRepartition-2004.jpeg")

ggplot(dem05, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2005")
ggsave("1.1-NationalityRepartition-2005.jpeg")

ggplot(dem06, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2006")
ggsave("1.1-NationalityRepartition-2006.jpeg")

ggplot(dem08, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2008")
ggsave("1.1-NationalityRepartition-2008.jpeg")

ggplot(dem10, aes(x=factor(NATION))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("1"), labels=c("Français")) +
  ggtitle("Distribution of nationalities in the dataset in 2010")
ggsave("1.1-NationalityRepartition-2010.jpeg")



#ggplot(dem00, aes(x=SEXE, fill=SITMAT)) +
#  geom_bar(stat="Identity", width=.75, position="dodge") +
#  labs(x = "Gender") +
#  scale_x_discrete(breaks=c("1", "2"), labels=c("Male", "Female"))+
#  scale_fill_brewer(palette="RdGy") +
#  ggtitle("Repartition of children for each marital situation, per gender, in 2010")



## 2. REPARTITION MARRIAGE AND CHILDREN
ggplot(dem00, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2000")
ggsave("2-MaritalSituationDistrib-2000.jpeg")

ggplot(dem02, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2002")
ggsave("2-MaritalSituationDistrib-2002.jpeg")

ggplot(dem04, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2004")
ggsave("2-MaritalSituationDistrib-2004.jpeg")

ggplot(dem05, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2005")
ggsave("2-MaritalSituationDistrib-2005.jpeg")

ggplot(dem06, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2006")
ggsave("2-MaritalSituationDistrib-2006.jpeg")

ggplot(dem08, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2008")
ggsave("2-MaritalSituationDistrib-2008.jpeg")

ggplot(dem10, aes(x=factor(SITMAT))) +
  geom_histogram(binwidth=0.5, fill="lightblue", colour="black", origin=0) +
  labs(x = "Family Situation", y = "Number of individuals") +
  scale_x_discrete(breaks=c("C", "D", "M", "V"), labels=c("Single", "Divorced", "Married", "Widowed")) +
  ggtitle("Distribution of each marital situation in the dataset in 2010")
ggsave("2-MaritalSituationDistrib-2010.jpeg")


ggplot(dem00, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2000") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2000.jpeg")

ggplot(dem02, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2002") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2002.jpeg")

ggplot(dem04, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2004") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2004.jpeg")

ggplot(dem05, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2005") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2005.jpeg")

ggplot(dem06, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2006") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2006.jpeg")

ggplot(dem08, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2008") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2008.jpeg")

ggplot(dem10, aes(x=factor(NENF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Number of children", y="Number of occurences") +
  ggtitle("Distribution of number of children in the dataset in 2010") +
  facet_grid(SEXE ~ .)
ggsave("2.1-DistriChildGender-2010.jpeg")



ggplot(dem00, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2000)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2000.jpeg")

ggplot(dem02, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2002)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2002.jpeg")


ggplot(dem04, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2004)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2004.jpeg")

ggplot(dem05, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2005)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2005.jpeg")

ggplot(dem06, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2006)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2006.jpeg")

ggplot(dem08, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2008)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2008.jpeg")

ggplot(dem10, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(QUALIF ~ .) +
  ggtitle("Distribution of number of children, per qualification (2010)") +
  labs(x = "Number of children", y="Number of occurences per qual. level")
ggsave("2.2-DistriChildQualif-2010.jpeg")


ggplot(dem00, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2000)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2000.jpeg")


ggplot(dem02, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2002)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2002.jpeg")

ggplot(dem04, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2004)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2004.jpeg")

ggplot(dem05, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2005)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2005.jpeg")

ggplot(dem06, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2006)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2006.jpeg")

ggplot(dem08, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2008)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2008.jpeg")

ggplot(dem10, aes(x=factor(NENF))) + # Save the base object for reuse
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  facet_grid(SITMAT ~ .) +
  ggtitle("Distrib. of nb of children among sample, per personal situation (2010)") +
  labs(x = "Number of children", y="Number of occurences per personal situation")
ggsave("2.3-DistriChildMarital-2010.jpeg")


## 3. Qualifications of the individuals

ggplot(dem00, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2000, per gender")
ggsave("3.1-DistriQualifGender-2000.jpeg")

ggplot(dem02, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2002, per gender")
ggsave("3.1-DistriQualifGender-2002.jpeg")


ggplot(dem04, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2004, per gender")
ggsave("3.1-DistriQualifGender-2004.jpeg")

ggplot(dem05, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2005, per gender")
ggsave("3.1-DistriQualifGender-2005.jpeg")

ggplot(dem06, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2006, per gender")
ggsave("3.1-DistriQualifGender-2006.jpeg")

ggplot(dem08, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2008, per gender")
ggsave("3.1-DistriQualifGender-2008.jpeg")

ggplot(dem10, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Qualification", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9"), labels=c("Manoeu.", "Ouv. Spé.", "Ouv. Qu.", "Ouv. Qu.", "Emp. Non Qu.", "Empl. Qu.", "Tech-Dess.", "Ag. Maitr.", "Cadres"))+
  facet_grid(SEXE~.) +
  ggtitle("Repartition of qualifications in 2010, per gender")
ggsave("3.1-DistriQualifGender-2010.jpeg")


ggplot(dem00, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2000, per qualification")
ggsave("3.2-DistriInterim-2000.jpeg")


ggplot(dem02, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2002, per qualification")
ggsave("3.2-DistriInterim-2002.jpeg")


ggplot(dem04, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2004, per qualification")
ggsave("3.2-DistriInterim-2004.jpeg")


ggplot(dem05, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2005, per qualification")
ggsave("3.2-DistriInterim-2005.jpeg")


ggplot(dem06, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2006, per qualification")
ggsave("3.2-DistriInterim-2006.jpeg")


ggplot(dem08, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2008, per qualification")
ggsave("3.2-DistriInterim-2008.jpeg")


ggplot(dem10, aes(x=factor(QUALIF))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Interim", y="Distr. of the 'interimaires' per qual. level") +
  facet_grid(interimaire ~.) +
  ggtitle("Distr. of 'interimaires' in 2010, per qualification")
ggsave("3.2-DistriInterim-2010.jpeg")


## 4. Nature of the employment demand

ggplot(dem00, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2000, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2000.jpeg")

ggplot(dem02, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2002, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2002.jpeg")

ggplot(dem04, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2004, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2004.jpeg")

ggplot(dem05, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2005, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2005.jpeg")

ggplot(dem06, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2006, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2006.jpeg")

ggplot(dem08, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2008, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2008.jpeg")

ggplot(dem10, aes(x=factor(TEMPS))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ggtitle("Repartition of job duration wanted in 2010, per gender") +
  labs(x = "Job duration", y="Number of occurences") +
  scale_x_discrete(breaks=c("1", "2"), labels=c("Full time", "Part-time")) +
  facet_grid(SEXE ~ .)
ggsave("4.1-DistriCDD-CDI-2010.jpeg")



ggplot(dem00, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2000")
ggsave("4.2-Distri-Duree-Chom-2000.jpeg")


ggplot(dem02, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2002")
ggsave("4.2-Distri-Duree-Chom-2002.jpeg")

ggplot(dem04, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2004")
ggsave("4.2-Distri-Duree-Chom-2004.jpeg")

ggplot(dem05, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2005")
ggsave("4.2-Distri-Duree-Chom-2005.jpeg")

ggplot(dem06, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2006")
ggsave("4.2-Distri-Duree-Chom-2006.jpeg")

ggplot(dem08, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2008")
ggsave("4.2-Distri-Duree-Chom-2008.jpeg")

ggplot(dem10, aes(x=factor(duree_de_mois))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Nb of months of DE", y="Count of occurences") +
  ggtitle("Repartition of the number of months each demand lasts, in 2010")
ggsave("4.2-Distri-Duree-Chom-2010.jpeg")




## 5. REDUCED ACTIVITY BEHAVIOUR

## Salaire brut de l'activité réduite
ggplot(dem00, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2000")
ggsave("5.1-Distri-Duree-Chom-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2002")
ggsave("5.1-Distri-Duree-Chom-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2004")
ggsave("5.1-Distri-Duree-Chom-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2005")
ggsave("5.1-Distri-Duree-Chom-2005.jpeg")


ggplot(dem06, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2006")
ggsave("5.1-Distri-Duree-Chom-2006.jpeg")


ggplot(dem08, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2008")
ggsave("5.1-Distri-Duree-Chom-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=moy_salar)) +
  labs(x = "Nb of AR hours worked", y="Mean wage earned") +
  geom_point() +
  ylim(0, 7500) +
  ggtitle("Distrib. of the mean wages per number of AR hours worked, in 2010")
ggsave("5.1-Distri-Duree-Chom-2010.jpeg")



ggplot(dem00, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2000")
ggsave("5.2-Distri-Daily-Wage-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2002")
ggsave("5.2-Distri-Daily-Wage-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2004")
ggsave("5.2-Distri-Daily-Wage-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2005")
ggsave("5.2-Distri-Daily-Wage-2005.jpeg")

ggplot(dem06, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2006")
ggsave("5.2-Distri-Daily-Wage-2006.jpeg")

ggplot(dem08, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2008")
ggsave("5.2-Distri-Daily-Wage-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=sal_jour_ref)) +
  geom_point() +
  labs(x = "Nb of AR hours worked", y="Daily reference wage") +  
  ggtitle("Distribution of the daily ref wage per nb of AR hours worked, in 2010")
ggsave("5.2-Distri-Daily-Wage-2010.jpeg")



ggplot(dem00, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2000)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2000.jpeg")

ggplot(dem02, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2002)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2002.jpeg")

ggplot(dem04, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2004)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2004.jpeg")

ggplot(dem05, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2005)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2005.jpeg")

ggplot(dem06, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2006)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2006.jpeg")

ggplot(dem08, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2008)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2008.jpeg")

ggplot(dem10, aes(x=moy_salar, y=sal_jour_ref, colour=factor(ageq))) +
  geom_point(size=2) +
  labs(x = "Mean Wage", y="Daily reference wage") +  
  ggtitle("Interaction per age of mean wage and daily reference wage (2010)") +
  scale_fill_discrete(labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9"))  
ggsave("5.3-Distri-RefWage-MeanWage-2010.jpeg")


# 6. COMPENSATION AND RA BEHAVIOUR

# le montant total payé sur tous les PI de la DE : som_mtpaye
ggplot(dem00, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2000")
ggsave("6.1-Distri-RefWage-MeanWage-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2002")
ggsave("6.1-Distri-RefWage-MeanWage-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2004")
ggsave("6.1-Distri-RefWage-MeanWage-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2005")
ggsave("6.1-Distri-RefWage-MeanWage-2005.jpeg")

ggplot(dem06, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2006")
ggsave("6.1-Distri-RefWage-MeanWage-2006.jpeg")

ggplot(dem08, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2008")
ggsave("6.1-Distri-RefWage-MeanWage-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=som_mtpaye)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "RA in hours", y = "total unemployment compensation on total ED") +
  ggtitle("Distrib. of compensations on total ED, per RA hours worked, in 2010")
ggsave("6.1-Distri-RefWage-MeanWage-2010.jpeg")


# le nombre total de jours non indemnisés pour cause AR : SOM_DURNONAR
ggplot(dem00, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2000)")
ggsave("6.2-Distri-NonCompTotal-RA-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2002)")
ggsave("6.2-Distri-NonCompTotal-RA-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2004)")
ggsave("6.2-Distri-NonCompTotal-RA-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2005)")
ggsave("6.2-Distri-NonCompTotal-RA-2005.jpeg")

ggplot(dem06, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2006)")
ggsave("6.2-Distri-NonCompTotal-RA-2006.jpeg")

ggplot(dem08, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2008)")
ggsave("6.2-Distri-NonCompTotal-RA-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=som_durnonar)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 2000) +
  labs(x = "RA in hours", y = "total non compensated days because RA work") +
  ggtitle("Distrib. of total non comp. days because RA (2010)")
ggsave("6.2-Distri-NonCompTotal-RA-2010.jpeg")


# le nombre total de jours payés en IND : SOM_DURPAYEE
ggplot(dem00, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2000")
ggsave("6.3-Distri-CompDays-Total-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2002")
ggsave("6.3-Distri-CompDays-Total-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2004")
ggsave("6.3-Distri-CompDays-Total-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2005")
ggsave("6.3-Distri-CompDays-Total-2005.jpeg")

ggplot(dem06, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2006")
ggsave("6.3-Distri-CompDays-Total-2006.jpeg")

ggplot(dem08, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2008")
ggsave("6.3-Distri-CompDays-Total-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=som_durpayee)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 3500) +
  labs(x = "RA in hours", y = "total compensation sum") +
  ggtitle("Distrib. of total days when compensated, per RA hours, in 2010")
ggsave("6.3-Distri-CompDays-Total-2010.jpeg")

# distribution mean rate of compensation per RA hours:
ggplot(dem00, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2000")
ggsave("6.4-Distri-MeanComp-perRA-2000.jpeg")

ggplot(dem02, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2002")
ggsave("6.4-Distri-MeanComp-perRA-2002.jpeg")

ggplot(dem04, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2004")
ggsave("6.4-Distri-MeanComp-perRA-2004.jpeg")

ggplot(dem05, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2005")
ggsave("6.4-Distri-MeanComp-perRA-2005.jpeg")

ggplot(dem06, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2006")
ggsave("6.4-Distri-MeanComp-perRA-2006.jpeg")

ggplot(dem08, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2008")
ggsave("6.4-Distri-MeanComp-perRA-2008.jpeg")

ggplot(dem10, aes(x=nb_ar, y=moy_txind)) +
  geom_point(binwidth=8, fill="white", colour="black", origin=0) +
  ylim(0, 125) +
  labs(x = "RA in hours", y = "Mean rate of compensation") +
  ggtitle("Distrib. of mean rates of compensation per RA hours worked, in 2010")
ggsave("6.4-Distri-MeanComp-perRA-2010.jpeg")

# Simple distribution of mean rate of compensation over sample:
ggplot(dem00, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2000")
ggsave("6.5-Distri-MeanComp-perRA-2000.jpeg")

ggplot(dem02, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2002")
ggsave("6.5-Distri-MeanComp-perRA-2002.jpeg")

ggplot(dem04, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2004")
ggsave("6.5-Distri-MeanComp-perRA-2004.jpeg")

ggplot(dem05, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2005")
ggsave("6.5-Distri-MeanComp-perRA-2005.jpeg")

ggplot(dem06, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2006")
ggsave("6.5-Distri-MeanComp-perRA-2006.jpeg")

ggplot(dem08, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2008")
ggsave("6.5-Distri-MeanComp-perRA-2008.jpeg")

ggplot(dem10, aes(x=moy_txind)) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  labs(x = "Rate of compensation", y = "occurences") +  
  ggtitle("Repartition of the mean rate of compensation over sample, in 2010")
ggsave("6.5-Distri-MeanComp-perRA-2010.jpeg")

# NB_AR distribution with respect to several categorical variables:

# First, nb_ar with respect to gender:
ggplot(dem00, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2000")
ggsave("6.6-Distri-NbAr-perGender-2000.jpeg")

ggplot(dem02, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2002")
ggsave("6.6-Distri-NbAr-perGender-2002.jpeg")

ggplot(dem04, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2004")
ggsave("6.6-Distri-NbAr-perGender-2004.jpeg")

ggplot(dem05, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2005")
ggsave("6.6-Distri-NbAr-perGender-2005.jpeg")

ggplot(dem06, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2006")
ggsave("6.6-Distri-NbAr-perGender-2006.jpeg")

ggplot(dem08, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2008")
ggsave("6.6-Distri-NbAr-perGender-2008.jpeg")

ggplot(dem10, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Number of occurences per type of gender") +  
  facet_grid(SEXE ~ .) +
  ggtitle("Repartition of the nb of RA hours per gender, in 2010")
ggsave("6.6-Distri-NbAr-perGender-2010.jpeg")





# Afterwards, nb_ar with respect to qualifications:
ggplot(dem00, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2000")
ggsave("6.6-Distri-NbAr-perGender-2000.jpeg")

ggplot(dem02, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2002")
ggsave("6.6-Distri-NbAr-perGender-2002.jpeg")

ggplot(dem04, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2004")
ggsave("6.6-Distri-NbAr-perGender-2004.jpeg")

ggplot(dem05, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2005")
ggsave("6.6-Distri-NbAr-perGender-2005.jpeg")

ggplot(dem06, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2006")
ggsave("6.6-Distri-NbAr-perGender-2006.jpeg")

ggplot(dem08, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2008")
ggsave("6.6-Distri-NbAr-perGender-2008.jpeg")

ggplot(dem10, aes(x=nb_ar)) +
  geom_histogram(binwidth=8, fill="white", colour="black", origin=0) +
  labs(x = "Number of RA hours", y = "Count of occurences per qualif. level") +
  facet_grid(QUALIF ~ .) +
  ggtitle("Repartition of the nb of RA hours per level of qualifications, in 2010")
ggsave("6.6-Distri-NbAr-perGender-2010.jpeg")

# 8. REASONS FOR THE ANNULMENT OF THE ED

ggplot(dem00, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2000") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2000.jpeg")

ggplot(dem02, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2002") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2002.jpeg")

ggplot(dem04, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2004") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2004.jpeg")

ggplot(dem05, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2005") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2005.jpeg")

ggplot(dem06, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2006") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2006.jpeg")

ggplot(dem08, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2008") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2008.jpeg")

ggplot(dem10, aes(x=factor(MOTANN))) +
  geom_histogram(binwidth=8, fill="lightblue", colour="black", origin=0) +
  ylim(0, 15) +
  labs(x = "Reason for annulment of ED", y = "Count") +
  ggtitle("Distribution of the reasons for annulment of the ED, in 2010") +
  scale_x_discrete(breaks=c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"), labels=c("Refus signature", "Abs convoc.", "Abs. rdv reclasst", "Refus offre emploi", "Refus action recl", "Abandon action recl", "Decl. inexacte", "Abs. 1er entretien", "Non prés à conv.", "Entrée APR", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Repr.empl.solo", "Creation Entr.")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("8.1-Distri-Annulment-2010.jpeg")

### STOP NEW CODING ###


















# 9. AR MOYEN PAR DEPARTEMENT:

tab2000 <- read.csv("meanAR_par_region_2000.csv", header=T, sep=";")

## DOT PLOTS PER REGION:
ggplot(tab2000, aes(x=AR.moyen, y=reorder(nom.dep, AR.moyen))) +
  geom_point(size=3) + # Use a larger dot
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dotted"))

ggplot(tab2000, aes(x=AR.moyen, y=reorder(region, AR.moyen))) +
  geom_point(size=3) + # Use a larger dot
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60", linetype="dotted"))


##### TABLEAUX :

## sapply() performs ("applies") a stated function to each subgroup in a split.
## dets the mean of nb_ar by each marital situation
ARmeanSitmat <- sapply(split(dem00$nb_ar,dem00$SITMAT),mean)
summary(ARmeanSitmat)
ARmeanSitmat

ARmeanNenf <- sapply(split(dem00$nb_ar,dem00$NENF),mean)
summary(ARmeanNenf)
ARmeanNenf


## REPARTITION PAR PASSIF DE DEMANDE D'EMPLOI
ARmeanDE <- sapply(split(dem00$nb_ar,dem00$num_de),mean)
summary(ARmeanDE)
ARmeanDE


ARmeanDEdeb <- sapply(split(dem00$nb_ar,dem00$ndem_deb),mean)
summary(ARmeanDEdeb)
ARmeanDEdeb


ARmeanDEagreg <- sapply(split(dem00$nb_ar,dem00$ndem_agreg),mean)
summary(ARmeanDEagreg)
ARmeanDEagreg


#### TO CREATE CATEGORIES FOR EACH FRENCH "DEPARTEMENT"

#1. Extract the said column from the original dataset:
DEPCOMsep <- dem00[, "DEPCOM"]

# Idea: we treat this variable as numeric and get rid of the 3 last numbers
# that define the code of the city (and then we get rid of what's after the comma)
DEPCOMsep <- round(dem00$DEPCOM / 1000, 0)
dem00$DEPCOMsep
summary(DEPCOMsep)


dem00$DEPCOMsep <- round(dem00$DEPCOMsep, 0)
dem00$DEPCOMsep
summary(dem00$DEPCOMsep)


# mean number of AR hours per department:
ARmeanDEPCOM <- sapply(split(dem00$nb_ar,dem00$DEPCOMsep),mean)
summary(ARmeanDEPCOM)
ARmeanDEPCOM