setwd("C:/Github/Data-Science-with-R/chapter01")

library('rpart')
library('rpart.plot')

##german Dataset : (https://archive.ics.uci.edu/ml/datasets/Statlog+(German+Credit+Data))
##GCD Dataset : (https://github.com/WinVector/zmPDSwR/blob/master/Statlog/GCDData.RData)

german <- read.table("./german.data")
load("GCDData.RData")

str(d)

##modeling
model <- rpart(Good.Loan ~
                 Duration.in.month +
                 Installment.rate.in.percentage.of.disposable.income +
                 Credit.amount +
                 Other.installment.plans,
               data=d,
               control=rpart.control(maxdepth=4),
               method="class")
rpart.plot(model)

##evaluating model
resultframe <- data.frame(Good.Loan=creditdata$Good.Loan, pred=predict(model, type="class"))
rtab <- table(resultframe)
rtab
sum(diag(rtab))/sum(rtab)
sum(rtab[1,1])/sum(rtab[,1])
sum(rtab[1,1])/sum(rtab[1,])
sum(rtab[2,1])/sum(rtab[2,])

##upper limit of model evaluation
tab1
sum(diag(tab1))/sum(tab1)
tab2
sum(diag(tab2))/sum(tab2)