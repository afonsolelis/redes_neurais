# install.packages("RSNNS")
library("RSNNS")

# bd <- read.table("C:\\Users\\leusto\\Google Drive\\03 - Codigos R - sobras do livro\\exemplo_regressao.csv",header=TRUE,sep=";")
# bd

x <- seq(1, 100)
y <- log(x)
plot(x, y, type = "l")

x <- normalizeData(x, type = "0_1")
y <- normalizeData(y, type = "0_1")

# Column bind the data into one variable
data <- cbind(x, y)
colnames(data) <- c("x", "y")


data <- splitForTrainingAndTest(x, y, ratio = 0.15)


##################
model <- mlp(data$inputsTrain, data$targetsTrain,
  size = c(2, 3),
  learnFuncParams = c(0.9),
  maxit = 100,
  learnFunc = "Std_Backpropagation",
  hiddenActFunc = "Act_Logistic",
  inputsTest = data$inputsTest,
  targetsTest = data$targetsTest,
  linOut = TRUE
)

plotIterativeError(model)


# plot dados de treinamento
predictions <- predict(model, as.data.frame(data$inputsTrain))
plot(data$inputsTrain, data$targetsTrain, xlab = "x", ylab = "y", type = "p", col = "blue", pch = 1, cex = 1.5, xlim = c(0, 1), ylim = c(0, 1))
points(data$inputsTrain, predictions, type = "p", col = "red", pch = 16)

# Lets display a better version of the results
cleanoutput <- cbind(data$targetsTrain, predictions)
colnames(cleanoutput) <- c("Expected Output", "Neural Net Output")
print(cleanoutput)


# plot dados de teste
predictions <- predict(model, as.data.frame(data$inputsTest))
plot(data$inputsTest, data$targetsTest, xlab = "x", ylab = "y", type = "p", col = "blue", pch = 1, cex = 1.5, xlim = c(0, 1), ylim = c(0, 1))
points(data$inputsTest, predictions, type = "p", col = "red", pch = 16)

cleanoutput <- cbind(data$targetsTest, predictions)
colnames(cleanoutput) <- c("Expected Output", "Neural Net Output")
print(cleanoutput)


###################


summary(model)

weightMatrix(model)
extractNetInfo(model)



plotIterativeError(model)
plotRegressionError(data$targetsTrain, predictions)
plotRegressionError(data$targetsTest, predictions)



confusionMatrix(data$targetsTrain, predictions)
confusionMatrix(data$targetsTest, predictions)
