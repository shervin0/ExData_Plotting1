
# Sourcing the function that reads the table 
source("readData.R")

print(" Reading data ...")

testData <- readData()

print( " Data is read")

#Opening the png file
png( "plot1.png", height = 480, width = 480, bg="white")

# Creating plot #1
hist( testData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

# Closing the png file
dev.off()


