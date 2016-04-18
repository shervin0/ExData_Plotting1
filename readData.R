
readData <- function(){
  
  print(" Started reading the file ...")
  
  # Read a small number of rows (20 here)
  mini_table <- read.table( "household_power_consumption.txt", header=TRUE, nrows = 20, sep=";", na.strings = "?", stringsAsFactors = FALSE)
  
  column_names <- colnames( mini_table ) 
  
  # Check what is in the piece of data read (called mini_table)
  # print( mini_table)
  
  # Find the size of the mini_table in the memory
  mini_table_size <- object.size(mini_table)
  
  # Find the number of rows in the mini_table
  mini_tables_num_rows <-  dim(mini_table)[1]

  # Read lines as strings
  file_lines <- readLines( "household_power_consumption.txt")
  
  # Find the number of lines in the original file (number of rows)
  number_of_rows <- length(file_lines)
    
  # Estimate approximately how much memory a row of the table takes once loaded
  single_row_size <- object.size(mini_table)/mini_tables_num_rows
  
  # Estimate approximately how much memory the whole table takes once loaded
  estimated_table_size <- number_of_rows*single_row_size

  print( paste(" Estimated size of the table in memory : ", round(estimated_table_size/(2^20)), "MB" ))
  
  classes <- sapply( mini_table, class)
  
  # Which lines containt the dates we need?
  day1_lines <- grep("\\b1/2/2007", file_lines)
  day2_lines <- grep("\\b2/2/2007", file_lines)
  
  # Find the first/last lines that need to be read from the file
  first_line  <- min( c( min(day1_lines), min(day2_lines) ))
  last_line   <- max( c( max(day2_lines), max(day2_lines) )) 
  
  # Number of lines to be skipped
  num_lines_to_skip <- first_line - 1 
  
  # Number of lines to be read
  num_lines_to_read <- last_line - first_line + 1 
  
  # Freeing up some memory used for reading the lines of the file
  rm("file_lines")
  
  # This is where the file is actually read into a table                    
  completeTable <- read.table("household_power_consumption.txt", col.names = column_names, colClasses = classes, sep=";", na.strings = "?", skip = num_lines_to_skip, nrows = num_lines_to_read )
  
  # Creating the actual date/time character string
  dt <- paste(completeTable$Date, completeTable$Time)
  
  # Fixing the Time and Date to the desired format
  completeTable$Time <- strptime(dt, "%d/%m/%Y %H:%M:%S")
  completeTable$Date <- as.Date(completeTable$Date, "%d/%m/%Y")
  
  
  # Debug code
  
  # Checking the classes
  #new_classes <- sapply( completeTable, class)
  
  #print("Head:")
  #print(head(completeTable))
  
  #print("Tail:")
  #print(tail(completeTable))
  
  #Subsetting the data ...
  #testData <- subset( completeTable, sapply( completeTable$Date, isDateInRange) )
  
  # print( str(testData))
  print(" The file is read ...")
  
  completeTable
  
}