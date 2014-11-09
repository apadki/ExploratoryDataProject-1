## set up the png device
png(file="plot2.png", height=480, width=480)
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

plot(selectdata$Global_active_power~selectdata$finalTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
#close device
dev.off()
