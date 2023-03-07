N<-10
X<-seq(1:N)
Y<-2*(X)+3
plot(X,Y,type="o",xlim=c(0,10),ylim=c(0,25))

X<-X/max(X)
X<-t(t(X))
bias<-1
X<-cbind(X,bias)
print(X)

Y<-Y/max(Y)
print(cbind(Y))

epoca_max<-3000
eta<-0.01
W<-c(0,1)

err_iter <- rep(0,N)
err_epoc <- rep(0,epoca_max)

for(epoca in 1:epoca_max){
  for(i in 1:N) {
    v<-sum(X[i,]*W)
    erro<-Y[i]-v
    delta<-(eta*erro*X[i,])
    W<-W+delta
    err_iter[i]<-0.5*(erro^2)
  }
  err_epoc[epoca]<-(sum(err_iter))
}

plot(err_epoc,type="line",xlab = "época", ylab = "erro quadrático médio",)

print(W)

Y_estimado = X[,1]*W[1]+W[2] 

plot(X[,1],Y,type="n")#,ylim=c(0.5, 1.2))
points(X[,1],Y,pch=1,type="o",col="1")
points(X[,1],Y_estimado,pch=16,type="p",col="2")
legend(0.1,0.9,legend=c("Y_desejado","Y_estimado"),col=c(1,2), pch=c(1,16))

print(paste("Erro final do treinamento",err_epoc[epoca_max]))
