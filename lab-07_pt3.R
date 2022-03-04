library(pROC)
library(plotROC)
library(randomForest)
library(caret)



roc_curve <- roc(spotify_aug, target, .fitted, plot=TRUE, percent = TRUE, xlab="False Positive %",
                ylab="False Negative %")
roc_curve


coords(roc_curve, "best", ret = "threshold")

spotify_aug <- mutate(spotify_aug, pred = ifelse(.fitted > 0.2066671, 1, 0))

spotify_aug$pred <- as.factor(spotify_aug$pred)

confusionMatrix(spotify_aug$pred, spotify_aug$target)

spotify_aug$target
