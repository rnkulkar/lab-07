library(tidyverse)
library(broom)
library(pROC)
library(plotROC)
library(car)

spotify_aug <- augment(model, spotify)

ggplot(spotify_aug, aes(x=.resid, y=.fitted)) + geom_bin2d()

ggplot(spotify_aug, aes(x=.resid, y=danceability)) + geom_point()

ggplot(spotify_aug, aes(x=key, y=.resid)) + geom_boxplot()
