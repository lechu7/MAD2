#wczytywanie danych (trzeba œcie¿kê dobrze ustawiæ)
train = read.csv("E:/MAD/R/train.csv", sep = "\t", dec = ",")
test = read.csv("E:/MAD/R/test.csv", sep = "\t", dec = ",")

#wypisywanie struktury danych
str(train)

#ustawianie seeda generatora liczb losowych
set.seed(1)

#zamiana typu zmienney Y z inta na factor
train$Y <- as.factor(train$Y)
test$Y <- as.factor(test$Y)

########### Regresja Liniowa ############

#Damian
#RegLin = lm(Y~X1+X6+X11+X16+X21, data = train)

#Daniel
#RegLin = lm(Y~X2+X7+X12+X17+X22, data = train)

#Mateusz
#RegLin = lm(Y~X3+X8+X13+X18+X23, data = train)

#Jakub
#RegLin = lm(Y~X4+X9+X14+X19, data = train)

#Dawid
#RegLin = lm(Y~X5+X10+X15+X20, data = train)

#Ca³oœæ
RegLin = lm(Y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23, data = train)

#Podsumowanie regresji
summary(RegLin)
summary(RegLin)$r.squared 

#Przewidywanie
pred<-predict(RegLin, test)
table(test$Y, pred)

#kopiowanie wyniku do schowka
write.table(pred, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)