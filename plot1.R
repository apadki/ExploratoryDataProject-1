
## set up the png device
png(file="plot1.png", height=480, width=480)
## Read data set
df = read.csv("household_power_consumption.txt", na.strings="?",
              header=TRUE, sep=";")
## Subsetting the dataset
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
selectdata <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Generate Histogram
hist(selectdata$Global_active_power, main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red" )
## close device
dev.off()