# install.packages("RSNNS")
library("RSNNS")
library("plyr")

# bd <- read.table("C:\\Users\\leusto\\Google Drive\\03 - Codigos R - sobras do livro\\exemplo_regressao.csv",header=TRUE,sep=";")
# bd


dataset <- iris[which(iris$Species != "setosa"), ][1:2 - 3]
head(dataset)

plot(dataset[, 1], dataset[, 2], pch = c(16, 19), col = dataset$Species, xlab = "Petal length", ylab = "Petal width")
legend(3, 2.2, legend = c("versicolor", "virginica"), col = c(2, 3), pch = c(16, 19))


x <- dataset[, 1:2]
y <- dataset[, 3]


x <- normalizeData(x, type = "0_1")


classes <- as.numeric(y)
classes_bin <- mapvalues(classes, from = c(2, 3), to = c(0, 1))
print((classes_bin))



data <- splitForTrainingAndTest(x, classes_bin, ratio = 0.15)


##################
model <- mlp(data$inputsTrain, data$targetsTrain,
  size = c(2, 3),
  learnFuncParams = c(0.9),
  maxit = 100,
  learnFunc = "Std_Backpropagation",
  hiddenActFunc = "Act_Logistic",
  inputsTest = data$inputsTest,
  targetsTest = data$targetsTest,
  linOut = FALSE
)

plotIterativeError(model)


# plot dados de treinamento
predictions <- predict(model, as.data.frame(data$inputsTrain))

# Lets display a better version of the results
cleanoutput <- cbind(data$targetsTrain, predictions)
colnames(cleanoutput) <- c("Expected Output", "Neural Net Output")
print(cleanoutput)


confusionMatrix(data$targetsTrain, predictions > 0.4)


# plot dados de teste
predictions <- predict(model, as.data.frame(data$inputsTest))

cleanoutput <- cbind(data$targetsTest, predictions)
colnames(cleanoutput) <- c("Expected Output", "Neural Net Output")
print(cleanoutput)

confusionMatrix(data$targetsTest, predictions > 0.4)


###################


summary(model)

weightMatrix(model)
extractNetInfo(model)



plotIterativeError(model)
plotRegressionError(data$targetsTrain, predictions)
plotRegressionError(data$targetsTest, predictions)



# confusionMatrix(data$targetsTrain,predictions)
# confusionMatrix(data$targetsTest,predictions)
