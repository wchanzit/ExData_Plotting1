#Load data into R.
fileloc <- "./Johns_Hopkins_Data_Science_Certificate/04_Exploratory_Data_Analysis/Quizzes_and_Programming_Assignments/Project1"
datafile <- "household_power_consumption.txt"
data <- read.table(paste0(fileloc,"/",datafile),sep=";",header=TRUE)


#Filter down to dates 2007/02/01-02.
dateFilter <- (data$Date == "1/2/2007") | (data$Date == "2/2/2007")
data2 <- data[dateFilter,]


#Format data
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))

DateProc <- strptime(data2$Date, format = "%d/%m/%Y")
TimeProc <- strptime(data2$Time, format = "%H:%M:%S")
TimeProc <- TimeProc - strptime(Sys.Date(), format = "%Y-%m-%d")
data2$DateTime <- DateProc + TimeProc


#Plot 2
png(file = "plot2.png")

plot(data2$DateTime,data2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()