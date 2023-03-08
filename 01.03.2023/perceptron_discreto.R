x1 <- c(0, 0, 1)
x2 <- c(0, 1, 1)
x3 <- c(1, 0, 1)
x4 <- c(1, 1, 1)

X <- rbind(x1, x2, x3, x4)
print(X)

Y <- c(0, 0, 0, 1)
print(Y)

plot(X, type = "n")
points(x1[1], x1[2], pch = c(19), cex = 2, col = "2")
points(x2[1], x2[2], pch = c(19), cex = 2, col = "2")
points(x3[1], x3[2], pch = c(19), cex = 2, col = "2")
points(x4[1], x4[2], pch = c(15), cex = 2, col = "1")
legend(0.4, 0.6, legend = c("0", "1"), col = c(2, 1), pch = c(19, 15))

# W<-c(0,0,1)
# W<-c(0.1,0.1,1)
W <- c(0.1, 0, 1)

# eta<-0.1
eta <- 0.01

epoca_max <- 20

erro_ite <- rep(0, dim(X)[1])

erro_total <- rep(0, epoca_max)

for (epoca in 1:epoca_max) {
  for (i in 1:dim(X)[1]) {
    v <- sum(X[i, ] * W)
    if (v > 0) {
      y_calc <- 1
    } else {
      y_calc <- 0
    }
    erro <- Y[i] - y_calc
    delta <- (eta * erro * X[i, ])
    W <- W + delta
    erro_ite[i] <- erro^2
  }
  erro_total[epoca] <- sum(erro_ite)
  if (sum(erro_ite) == 0) {
    break
  }
}

print(paste("Número de épocas usadas no treinamento", epoca, "de um máximo de", epoca_max))

print(W)

print(erro_total)

plot(erro_total, type = "l")

plot(X, type = "n", xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5))
points(x1[1], x1[2], pch = c(19), cex = 2, col = "2")
points(x2[1], x2[2], pch = c(19), cex = 2, col = "2")
points(x3[1], x3[2], pch = c(19), cex = 2, col = "2")
points(x4[1], x4[2], pch = c(15), cex = 2, col = "1")
legend(0.4, 0.6, legend = c("0", "1"), col = c(2, 1), pch = c(19, 15))

x_1 <- -(W[3] / W[1])

x_2 <- -(W[3] / W[2])

segments(x_1, 0, 0, x_2)
