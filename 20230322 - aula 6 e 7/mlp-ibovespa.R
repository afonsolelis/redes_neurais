install.packages("RSNNS")
library("RSNNS")

bd <- read.table("ibovespa_3.csv", header = TRUE, sep = ";")
x <- bd[, 1]

x <- normalizeData(x, type = "0_1")
plot(x)


tam_janela <- 10
nro_padroes <- trunc(dim(x)[1] / tam_janela)
dataset <- matrix(x, nrow = tam_janela, ncol = nro_padroes)
dataset <- t(dataset)
plot(dataset[, tam_janela])

# Column bind the data into one variable
x <- dataset[, 1:tam_janela - 1]
y <- dataset[, tam_janela]


data <- splitForTrainingAndTest(x, y, ratio = 0.20)


##################
model <- mlp(data$inputsTrain, data$targetsTrain,
  size = c(2),
  learnFuncParams = c(0.9),
  maxit = 20000,
  learnFunc = "Std_Backpropagation",
  hiddenActFunc = "Act_Logistic",
  inputsTest = as.data.frame(data$inputsTest),
  targetsTest = data$targetsTest,
  linOut = TRUE
)



summary(model)
model
weightMatrix(model)
extractNetInfo(model)



plotIterativeError(model)




# plot dados de treinamento
predictions <- predict(model, data$inputsTrain)
plot(seq(1, length(data$targetsTrain)), data$targetsTrain, xlab = "x", ylab = "y", type = "p", col = "blue", pch = 1, cex = 1.5)
points(predictions, type = "p", col = "red", pch = 16)


# plot dados de teste
predictions <- predict(model, as.data.frame(data$inputsTest))
plot(seq(1, length(data$targetsTest)), data$targetsTest, xlab = "x", ylab = "y", type = "p", col = "blue", pch = 1, cex = 1.5)
points(predictions, type = "p", col = "red", pch = 16)
