library(tidyverse)
library(broom)
library(pROC)
library(plotROC)
library(car)

spotify <- read.csv("data/spotify.csv")


spotify$target <- as.factor(spotify$target)


spotify$key <- as.factor(spotify$key)
spotify$key <- fct_recode(spotify$key, "D" = "2", "D#" = "3", "Other" = "0", "Other" = "1", "Other" = "4", "Other" = "5",
           "Other" = "6", "Other" = "7", "Other" = "8", "Other" = "9", "Other" = "10", "Other" = "11",)



ggplot(spotify, aes(x=target, fill=key)) + geom_bar()


model <- glm(target ~ acousticness + danceability + duration_ms + instrumentalness 
            + loudness + speechiness + valence, spotify, family=binomial)
model


model_test <- glm(target ~ acousticness + danceability + duration_ms + instrumentalness 
                 + loudness + speechiness + valence + key, spotify, family=binomial)
summary(model_test)

anova(model, model_test, test="Chisq")

model <- model_test



