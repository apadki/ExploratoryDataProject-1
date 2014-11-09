png(file="plot4.png", height=502, width=502)
## set up the png device
png(file="plot4.png", height=480, width=480)
## Read data set
df = read.csv("household_power_consumption.txt", na.strings="?",
              header=TRUE, sep=";")
## Subsetting the dataset
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
## Concatenate date and time and add as a new column
datetime = paste(selectdata$Date, selectdata$Time, sep=" ")
finalTime = strptime(datetime,"%Y-%m-%d %H:%M:%S")
selectdata = cbind(selectdata, finalTime)

## Add plots in column ways

par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(selectdata, {
## Plot 1

plot(selectdata$Global_reactive_power~selectdata$finalTime, type="l",
     ylab="Global Active Power", xlab="")
##plot2
plot(selectdata$Sub_metering_1~selectdata$finalTime, type="l",
     ylab="Energy sub metering", xlab="", col="black")
lines(selectdata$Sub_metering_2~selectdata$finalTime, col="red")
lines(selectdata$Sub_metering_3~selectdata$finalTime, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ,
       col=c("black", "red", "blue"), lty=c("solid","solid", "solid"), lwd= c(1,1,1), 
       cex=1, x.intersp=1, bty="n")
##plot3

plot(selectdata$Voltage~selectdata$finalTime, type="l",
     ylab="Voltage", xlab="datetime")
##plot4
plot(selectdata$Global_reactive_power~selectdata$finalTime, type="l",
     ylab="Global_reactive_power", xlab="datetime")
}
)
## close device
dev.off()