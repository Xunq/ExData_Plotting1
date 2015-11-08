plot1 <- function()
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
    
      
    # plot
    png(file="plot1.png",width=480,height=480)
    
    with(powerdata,hist(Global_active_power,
                        col="red",
                        xlab="Globale Active Power (killowatts)",
                        main="Global Active Power"))
    
 
    dev.off()
    
}