
# Sourcing the function that reads the table 
source("readData.R")

print("Reading data ...")

testData <- readData()

print( "Data is read")

# Opening the png file
png( "plot3.png", height = 480, width = 480, bg="white")

par( mfrow = c(1,1))

with( testData, plot( Time, Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))

with( testData, lines( Time, Sub_metering_1))
with( testData, lines( Time, Sub_metering_2, col = "red"))
with( testData, lines( Time, Sub_metering_3, col = "blue"))

legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))

print("Plot 3 is created!")

dev.off()