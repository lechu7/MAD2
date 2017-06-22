#wczytywanie danych (trzeba œcie¿kê dobrze ustawiæ)
train = read.csv("D:/Desktop/DrzewaDecyzyjne/train.csv", sep = "\t", dec = ",")
test = read.csv("D:/Desktop/DrzewaDecyzyjne/test.csv", sep = "\t", dec = ",")

#wypisywanie kilku pierwszych wierszy
head(train)

#wypisywanie struktury danych
str(train)

#ustawianie seeda generatora liczb losowych, ¿eby random zawsze zwraca³ to samo
set.seed(2)

#zamiana typu zmiennej Y z inta na factor
train$Y <- as.factor(train$Y)
test$Y <- as.factor(test$Y)

#instalacja biblioteki

install.packages("randomForest")
library("randomForest")

##########LAS LOSOWY###################

#Damian
randomforest<-randomForest(Y~X1+X6+X11+X16+X21,data=train,importance=TRUE,proximity=TRUE)

#Daniel
randomforest<-randomForest(Y~X2+X7+X12+X17+X22,data=train,importance=TRUE,proximity=TRUE)

#Mateusz
randomforest<-randomForest(Y~X3+X8+X13+X18+X23,data=train,importance=TRUE,proximity=TRUE)

#Jakub
randomforest<-randomForest(Y~X14+X9+X14+X19,data=train,importance=TRUE,proximity=TRUE)

#Dawid
randomforest<-randomForest(Y~X5+X10+X15+X20,data=train,importance=TRUE,proximity=TRUE)

#Ca³oœæ
randomforest<-randomForest(Y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23,data=train,importance=TRUE,proximity=TRUE)

pred<-predict(randomforest, test, type="class")
	
#kopiowanie wyniku do schowka
write.table(pred, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)

table(test$Y, pred)