## set up the png device
png(file="plot3.png", height=480, width=480)
## Read data set
df = read.csv("household_power_consumption.txt", na.strings="?",
              header=TRUE, sep=";")
## Subsetting the dataset
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
## Concatenate date and time and add as a new column
datetime = paste(selectdata$Date, selectdata$Time, sep=" ")
finalTime = strptime(datetime,"%Y-%m-%d %H:%M:%S")
selectdata = cbind(selectdata, finalTime)

## plot

plot(selectdata$Sub_metering_1~selectdata$finalTime, type="l",
     ylab="Energy sub metering", xlab="", col="black")
lines(selectdata$Sub_metering_2~selectdata$finalTime, col="red")
lines(selectdata$Sub_metering_3~selectdata$finalTime, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ,
       col=c("black", "red", "blue"), lty=c("solid","solid", "solid"), lwd= c(1,1,1), 
       cex=1, x.intersp=1)
## close device
dev.off()
