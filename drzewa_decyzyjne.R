#wczytywanie danych (trzeba œcie¿kê dobrze ustawiæ)
train = read.csv("D:/Desktop/DrzewaDecyzyjne/train.csv", sep = "\t", dec = ",")
test = read.csv("D:/Desktop/DrzewaDecyzyjne/test.csv", sep = "\t", dec = ",")

#wypisywanie struktury danych
str(train)

#ustawianie seeda generatora liczb losowych, ¿eby random zawsze zwraca³ to samo
set.seed(1)

#zamiana typu zmiennej Y z inta na factor
train$Y <- as.factor(train$Y)
test$Y <- as.factor(test$Y)

#instalacja biblioteki

install.packages("rpart")
library("rpart")

##########DRZEWA DECYZYJNE###################

#Damian
tree <- rpart(Y~X1+X6+X11+X16+X21,data=train,control=rpart.control(minsplit=20,cp=0))

#Daniel
tree <- rpart(Y~X2+X7+X12+X17+X22,data=train,control=rpart.control(minsplit=20,cp=0))

#Mateusz
tree <- rpart(Y~X3+X8+X13+X18+X23,data=train,control=rpart.control(minsplit=20,cp=0))

#Jakub
tree <- rpart(Y~X14+X9+X14+X19,data=train,control=rpart.control(minsplit=20,cp=0))

#Dawid
tree <- rpart(Y~X5+X10+X15+X20,data=train,control=rpart.control(minsplit=20,cp=0))

#Ca³oœæ
tree <- rpart(Y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23,data=train,control=rpart.control(minsplit=20,cp=0))

pred<-predict(tree, test, type="class")

#rysowanie drzewa
plot(tree)					
text(tree) 
	
#kopiowanie wyniku do schowka
write.table(pred, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)

table(test$Y, pred)