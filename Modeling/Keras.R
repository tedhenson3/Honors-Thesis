library(keras)
library(tidyverse)
library(caret)

aau.keras= as_tibble(aau)

aau.keras = aau.keras %>%
  mutate_if(is.numeric, scale)
# install_keras(method = c("conda"),
#               conda = "auto", version = "default", tensorflow = "gpu")

folds <- createFolds(aau.keras$ws.per.game, k = 5)

#for(i in 1:length(folds)){
train_data = aau.keras[-c(folds$Fold1),]
test_data = aau.keras[folds$Fold1,]

build_model <- function() {
  
  model <- keras_model_sequential() %>%
    layer_dense(units = 64, activation = "relu",
                input_shape = dim(train_data)[2]) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dense(units = 1)
  
  model %>% compile(
    loss = "mse",
    optimizer = optimizer_rmsprop(),
    metrics = list("mean_absolute_error")
  )
  
  model
}

model <- build_model()
model %>% summary()