
source("readData.R")

print(" Reading data ...")

# Reading the data from the file  
testData <- readData()

print( " Data is read")

# Create the png file connection
png( "plot2.png", height = 480, width = 480, bg="white")

# Creating the plot
with( testData, plot( Time, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with( testData, lines( Time, Global_active_power))

#Closing the png file
dev.off()

