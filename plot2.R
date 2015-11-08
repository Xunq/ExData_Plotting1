plot2 <- function()
{
    # read data for analysis
    header<-read.table("household_power_consumption.txt",
                       nrow=1,
                       header=FALSE,
                       sep=";",
                       stringsAsFactors = FALSE)  
    
    powerdata<-read.table("household_power_consumption.txt",
                          sep=";",
                          header=FALSE,
                          skip=66637,
                          nrows=2881)
    
    colnames(powerdata)<-header
    
    powerdata$Date<-as.Date(powerdata$Date,
                            format="%d/%m/%Y")
    
    days<-with(powerdata,weekdays(seq(Date[1],
                                      tail(Date,1),"days"),
                                  abbreviate = TRUE))
    
    # plot
    png(file="plot2.png",width=480,height=480)
    
    with(powerdata,plot(Global_active_power,
                        col="black",
                        type="l",
                        xaxt="n",
                        xlab="",
                        ylab="Globale Active Power (killowatts)"))

    axis(1,at=c(0,60*24,60*24*2),labels=days)
    
  
    dev.off()
    
}