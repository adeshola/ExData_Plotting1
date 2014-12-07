## Set the dataUrl variable
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## Set the dataFile variable to the file being downloaded
dataFile <- "household_power_consumption.zip"

## Download the file in the current working directory
download.file(dataUrl, dataFile, method = "curl")

## Run an UNIX command to delete the uncompress file 
system("rm -f household_power_consumption.txt")

## Uncompress the zip file
system("unzip household_power_consumption.zip")

## Set the dataFile name to the uncompress file
dataFile <- sub("zip", "txt", dataFile)

## Create a file with the header line
system("head -1 household_power_consumption.txt > hpc.txt")

## UNIX grep the lines starting with the 2 days we are interested in.
system('grep "^[1,2]/2/2007" household_power_consumption.txt >> hpc.txt')

## Set the dataFile variable to file with subset
dataFile <- "hpc.txt"

## Import dataFile into R
hpc <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")

## Open the png device; create 'plot1.png' in the current working directory
png(filename = "plot1.png", width = 480, height = 480, units = "px");

## Create the plot using col, xlab and main parameters
hist(hpc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Close the png device
dev.off()

