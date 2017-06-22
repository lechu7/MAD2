#wczytywanie danych (trzeba œcie¿kê dobrze ustawiæ)
train = read.csv("C:/User/Desktop/R/train.csv", sep = "\t", dec = ",")
test = read.csv("C:/User/Desktop/R/test.csv", sep = "\t", dec = ",")

#wypisywanie kilku pierwszych wierszy
head(train)

#wypisywanie struktury danych
str(train)

#instalacja biblioteki
install.packages("MASS")
library(MASS)

#Damian
fit<-lda(Y~X1+X6+X11+X16+X21, data=train)

#Daniel
fit<-lda(Y~X2+X7+X12+X17+X22, data=train)

#Mateusz
fit<-lda(Y~X3+X8+X13+X18+X23, data=train)

#Jakub
fit<-lda(Y~X14+X9+X14+X19, data=train)

#Dawid
fit<-lda(Y~X5+X10+X15+X20, data=train)

#Ca³oœæ
fit<-lda(Y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23,data=train)

pred<-predict(fit, test)$class
t = table(pred, test$Y); t
1 - (t[1,2] + t[2,1]) / (t[1,1] + t[2,2])

#kopiowanie wyniku do schowka
write.table(pred, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)