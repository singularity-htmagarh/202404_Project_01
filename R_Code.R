---
  title: "Marketing Mix Modeling"
Author: "Heath Thapa"
---
install.packages("readxl")
library(readxl)

data = read_excel('MMM.xlsx')
head(data)
length(unique(data$BrandName))
attach(data)

Finlandia = subset(data,BrandName=='Finlandia')
dim(Finlandia)

#Filtering Data

Pr_Finlandia = data.frame(Finlandia$LnSales, Finlandia$LnPrice)
names(Pr_Finlandia) <- c('LnSales','LnPrice')

plot(x=Pr_Finlandia$LnPrice, y=Pr_Finlandia$LnSales,xlab='Log Price', ylab='Log Sales')

## Run a Linear Regression

result <- lm(formula='LnSales ~ LnPrice',data=Pr_Finlandia)
summary(result)

Ad_Finland <- subset(Finlandia, select=c('LnSales','LnMag','LnNews','LnOut','LnBroad','LnPrint','LnPrice'))

result_ad = lm('LnSales ~ .',data=Ad_Finland)
summary(result_ad)

result_inter = lm('LnSales ~ LnMag+LnNews+LnOut*LnBroad+LnPrint+LnPrice',data=Ad_Finland)
summary(result_inter)
