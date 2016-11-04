
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

T2010<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2010.csv", header = T)
T2011<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2011.csv", header = T)
T2012<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2012.csv", header = T)
T2013<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2013.csv", header = T)
T2014<-read.csv("https://raw.githubusercontent.com/tedevium/Ryerson-Capstone/master/Toronto/T1FF-N2014.csv", header = T)

T2010<-clean(T2010)
T2011<-clean(T2011)
T2012<-clean(T2012)
T2013<-clean(T2013)
T2014<-clean(T2014)

#5 testing things below

ty<-head(T2010)

y<-T2010[order(T2010$`All persons - Average Age` ,decreasing = T),] 
z<-head(y)
T2010$`Total income - #`
T2010$`Taxfilers - #`


ggplot(data=ty, aes(x=Neighbourhood, y ="Taxfilers - % 65+"))+
  geom_bar(stat="identity")

ggplot(data=dat, aes(x=time, y=total_bill)) + geom_bar(stat="identity")

y<-T2010[order(T2010$`Total income - Median - Total`,decreasing = T),c("Total income - Median - Total","Neighbourhood")]


