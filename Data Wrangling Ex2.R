titanic <- read.csv("titanic_original.csv", na.strings = c("", " ", "NA"))


#1
titanic$embarked[is.na(titanic$embarked)] <- "S"

#2.1
mean_age <- mean(titanic$age, na.rm = T)

titanic$age[is.na(titanic$age)] <- mean_age 

#2.2
#Inputation is usually not a good idea. But an alternative method could have been a conditional mean on embarkation.

#3
#Note that blank spaces were automatically read as NA is the way the dataset was loaded.
#For completeness it is changed to "None".
titanic$boat[is.na(titanic$boat)] <- "None"

#4
#4.1 No, some passangers probably never had a cabin in the first place.
#4.2 No cabin number probably means travelling in the main galley.

#5
titanic$has_cabin_number <- ifelse(is.na(titanic$cabin),0,1)

#6
write.csv(titanic, "titanic_clean.csv")