# instalação da biblioteca cross-validation
# install.packages("cvTools")
library(cvTools)
pastas <- cvFolds(n = 12, K = 4, type = "random")
# indices de pastas e subconjuntos
pastas
# subconjuntos
pastas$subsets
# pastas
pastas$which
# indices da pasta 1
indice_pasta1 <- which(pastas$which == 1)
# objetos mapeados na pasta 1
subconjunto_pasta1 <- pastas$subsets[indice_pasta1]


# Exemplo para a base iris
db_iris <- iris
n <- dim(db_iris)[1]
K <- 3
pastas <- cvFolds(n, K, type = "random")
# indices da pasta 1
indice_pasta1 <- which(pastas$which == 1)
# elementos mapeados na pasta 1
subconjunto_pasta1 <- pastas$subsets[indice_pasta1]
# objetos mapeados na pasta 1
db_fold1 <- db_iris[subconjunto_pasta1, ]


# Esqueleto da solução para a atividade desta semana
for (pasta in 1:K) {
  i_treino <- which(pastas$which != pasta)
  i_teste <- which(pastas$which == pasta)
}


#------------------------------

# Medida de Desempenho

y_estimado <- c(1, 1, 1, 2, 2, 2, 2, 3, 3, 3)
y_desejado <- c(1, 1, 1, 1, 2, 2, 2, 1, 2, 3)

matriz_confusao <- table(y_desejado, y_estimado)

acuracia <- sum(diag(matriz_confusao)) / length(y_desejado)
print(acuracia * 100)


# install.packages("RSNNS")
library("RSNNS")

y_desejado <- c(0, 0, 0, 0, 1, 1, 1, 1, 1)
y_estimado <- c(0, 0, 0, 1, 1, 0, 1, 1, 1)


teste <- confusionMatrix(y_desejado, y_estimado)
plotROC(y_desejado, y_estimado)
