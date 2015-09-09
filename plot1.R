#setwd("~/R/John Hopkin/4 - Exploratory Data Analysis/assignment1")

# read in the data for the two selected days
hpc <- read.table(pipe('grep -E "^[1-2]/2/2007" "exdata_data_household_power_consumption/household_power_consumption.txt"'), sep=";")
# set the columns names
colnames(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# change to Date objects
hpc[,"Date"] <- as.Date(hpc[,"Date"], "%d/%m/%Y")

png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
