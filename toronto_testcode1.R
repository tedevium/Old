
install.packages("plotly")
install.packages("ggplot2")
library(ggplot2)
library(plotly)

clean<-function(x) #Function to format imported table
  {     
  x<-x[,-1] #drop first column as unnecessary
  x<- setNames(data.frame(t(x[,-1])),x[,1]) #transpose table and set column names 
  x<- x[row.names(x) != "City.of.Toronto", ] #remove Row City of Toronto which is total from all neighbourhoods and will not be used
  x[is.na(x)]<-0 #set blank NA values to 0
  x$Neighbourhood<-as.factor(rownames(x))  #Add Neighbourhood column from rowname
      return(x)
  }


T2011<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2011.csv", header = T)
T2012<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2012.csv", header = T)
T2013<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2013.csv", header = T)
T2014<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2014.csv", header = T)


T2011<-clean(T2011)
T2012<-clean(T2012)
T2013<-clean(T2013)
T2014<-clean(T2014)



# testing things below

T2011a<- T2011[,c(6,15,26:28,407,413,419,425,431,437,443,449,455,461,467,473,479,485,491,497,503,509)]   #Pull key attributes related to demographics and income level

T2011b<- T2011a[,-c(1:6)]
T2011b<- head(T2011b[order(T2011b$`Wages/salaries/commissions - $000 - Total`,decreasing=FALSE),])
barplot(T2011b$`Wages/salaries/commissions - $000 - Total`,names.arg = rownames(T2011b),horiz = F,las=2)

corrplot(cor(T2011b))


incomechange<- data.frame(T2014$`Total income - Median - Total`-T2010$`Total income - Median - Total`,row.names(T2010))
names(incomechange)[1]<-"Change"
incomechange<-head(incomechange)
barplot(incomechange$Change, names.arg = incomechange$row.names.T2010.)

y<-T2010[order(T2010$`All persons - Average Age` ,decreasing = T),] 
z<-head(y)

#barplot(z$`Total income - Median - Total`,names.arg = row.names(z),)
T2010$`Total income - #`
T2010$`Taxfilers - #`


ggplot(data=ty, aes(x=Neighbourhood, y ="Taxfilers - % 65+"))+
  geom_bar(stat="identity")

ggplot(data=dat, aes(x=time, y=total_bill)) + geom_bar(stat="identity")

y<-T2010[order(T2010$`Total income - Median - Total`,decreasing = T),c("Total income - Median - Total","Neighbourhood")]


