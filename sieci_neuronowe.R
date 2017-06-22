#wczytywanie danych (trzeba œcie¿kê dobrze ustawiæ)
train = read.csv("D:/GitHub/MAD2/train.csv", sep = "\t", dec = ",")
test = read.csv("D:/GitHub/MAD2/test.csv", sep = "\t", dec = ",")

#wypisywanie kilku pierwszych wierszy
head(train)

#wypisywanie struktury danych
str(train)

#zamiana typu zmienney Y z inta na factor
train$Y <- as.factor(train$Y)
test$Y <- as.factor(test$Y)

#instalacja biblioteki
install.packages("nnet")
library(nnet)

#ustawianie seeda generatora liczb losowych
set.seed(1)

#Damian
fit<-nnet(Y~X1+X6+X11+X16+X21, data=train, size=3, decay = 0.1, maxit = 1000)

#Daniel
fit<-nnet(Y~X2+X7+X12+X17+X22, data=train, size=3, decay = 0.8, maxit = 1000)

#Mateusz
fit<-nnet(Y~X3+X8+X13+X18+X23, data=train, size=3, decay = 0.4, maxit = 1000)

#Jakub
fit<-nnet(Y~X14+X9+X14+X19, data=train, size=3, decay = 0.1, maxit = 1000)

#Dawid
fit<-nnet(Y~X5+X10+X15+X20, data=train, size=3, decay = 0.1, maxit = 1000)

#Ca³oœæ
fit<-nnet(Y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23,data=train, size=3, decay = 0.1, maxit = 1000)

pred<-predict(fit, test, type="class")
t = table(test$Y, pred); t
1 - (t[1,2] + t[2,1]) / (t[1,1] + t[2,2])

#kopiowanie wyniku do schowka
write.table(pred, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)