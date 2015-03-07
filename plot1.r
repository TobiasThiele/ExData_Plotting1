##Importing data
file <- "household_power_consumption.txt"
house <- read.csv(file, sep=";")

## Selecting data from the first and second of February 2007
newhouse <- house[house[,1]=="1/2/2007"|house[,1]=="2/2/2007",]

##Combining the time and data to a new column with a POSIX-time called TimeDate
datetime<-paste(newhouse[,1],newhouse[,2])
data <- cbind(strptime(datetime, "%d/%m/%Y %H:%M:%S"),newhouse)
colnames(data)[1]<-"DateTime"

##Plotting the graph as a png
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(as.character(data$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
