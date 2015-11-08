plot3 <- function()
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
    png(file="plot3.png",width=480,height=480)
    
    plot(powerdata$Sub_metering_1,
         type="n",
         xlab="",
         ylab="Energy sub metering",
         xaxt="n")
    
    with(powerdata,{
         lines(Sub_metering_1, col="black")
         lines(Sub_metering_2, col="red")
         lines(Sub_metering_3, col="blue")
    })

    axis(1,at=c(0,60*24,60*24*2),labels=days)
    
    legend("topright",
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty="solid",
           col=c("black","red","blue"))
    
    
    dev.off()
    
}