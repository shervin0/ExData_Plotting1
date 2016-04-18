
source("readData.R")

print("Reading data ...")

testData <- readData()

print( "Data is read")

# Create the png file connection
png( "plot4.png", height = 480, width = 480, bg="white")

# Setting up the rows and columns
par( mfrow = c(2,2))

# Plot(1,1) [Single Plot #2]
with( testData, plot( Time, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with( testData, lines( Time, Global_active_power))

# Plot(1,2)
with( testData, plot(Time, Voltage, xlab = "datetime", type="n"))
with( testData, lines(Time, Voltage))

# Plot(2,1) [Single Plot #3]
with( testData, plot( Time, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))

with( testData, lines( Time, Sub_metering_1))
with( testData, lines( Time, Sub_metering_2, col = "red"))
with( testData, lines( Time, Sub_metering_3, col = "blue"))

legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))

# Plot(2,2)
with( testData, plot(Time, Global_active_power, xlab = "datetime", ylab="Global_reactive_power", type = "n"))
with( testData, lines(Time, Global_active_power))


print("Plot 4 is created!")
