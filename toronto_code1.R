install.packages("ggplot2")
library(ggplot2)


clean<-function(x){
    x<-x[,-1]
  x<- setNames(data.frame(t(x[,-1])),x[,1])
 x<- x[row.names(x) != "City.of.Toronto", ]
  x[is.na(x)]<-0
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
