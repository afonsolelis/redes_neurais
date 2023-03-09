# Captura os dados Iris
data("iris")
head(iris)

# Separa????o dos dados
dataset<-iris[which(iris$Species!="versicolor"),][1:2-3]
head(dataset)

# Transforma????o para Bin??rio
library("plyr")
classes<-as.numeric(dataset$Species)
classes_bin<-mapvalues(classes,from=c(1,3),to=c(0,1))
print((classes_bin))

# Gravar o dataSet em X1 e X2 normalizado
x1<-dataset[,1]/max(dataset[,1])
x2<-dataset[,2]/max(dataset[,2])

X <- rbind(x1, x2)
print(X)

plot(X,type="n")
points(x1[1],x1[2],pch=c(19),cex=2,col="2")
points(x2[1],x2[2],pch=c(19),cex=2,col="2")
legend(0.4,0.6,legend=c("0","1"),col=c(2,1), pch=c(19,15))

W<-c(0,0,1)

eta<-0.1

epoca_max<-100

erro_ite<-rep(0,dim(X)[1])

erro_total<-rep(0,epoca_max)

for(epoca in 1:epoca_max){
  for(i in 1:dim(X)[1]) {
    v<-sum(X[i,]*W)
    if(v>0){
      y_calc<-1
    }else{
      y_calc<-0
    }
    erro<-Y[i]-y_calc
    delta<-(eta*erro*X[i,])
    W<-W+delta
    erro_ite[i]<-erro^2
  }
  erro_total[epoca]<-sum(erro_ite)
  if(sum(erro_ite)==0){
    break
  }
}

print(paste("N??mero de ??pocas usadas no treinamento",epoca,"de um m??ximo de",epoca_max))
