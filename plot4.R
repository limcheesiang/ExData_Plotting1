#setwd("~/R/John Hopkin/4 - Exploratory Data Analysis/assignment1")

# read in the data for the two selected days
hpc <- read.table(pipe('grep -E "^[1-2]/2/2007" "exdata_data_household_power_consumption/household_power_consumption.txt"'), sep=";")
# set the columns names
colnames(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# change to Date objects
hpc[,"Date"] <- as.Date(hpc[,"Date"], "%d/%m/%Y")

png("plot4.png", width=480, height=480)

# figure out the tick positions
ticpos=c(1, nrow(hpc[hpc$Date=="2007-02-01",])+1, nrow(hpc)+1)

par(mfcol=c(2,2), mar=c(5,4,3,2), oma = c(0, 0, 0, 0))

with (hpc, { 

  # plot the line graph, with x-axis suppressed
  plot(Global_active_power, type="l", main="", xlab="", ylab="Global Active Power", xaxt="n")
  # draw custom x-asix
  axis(1, at=ticpos, labels=c("Thu", "Fri", "Sat"))
  
  # initialise the plot, suppress x axis
  plot(Sub_metering_1, type="n", xaxt="n", xlab="", ylab="Energy sub metering")
  # draw custom x-axis
  axis(1, at=ticpos, labels=c("Thu", "Fri", "Sat"))
  # draw the 3 sub meterings
  lines(Sub_metering_1, type="l", col="black")
  lines(Sub_metering_2, type="l", col="red")
  lines(Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")
  
  plot(Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
  # draw custom x-asix
  axis(1, at=ticpos, labels=c("Thu", "Fri", "Sat"))  
  
  # plot the line graph, with x-axis suppressed
  plot(Global_reactive_power, type="l", xlab="datetime", xaxt="n")
  # draw custom x-axis
  axis(1, at=ticpos, labels=c("Thu", "Fri", "Sat"))

} )

dev.off()
