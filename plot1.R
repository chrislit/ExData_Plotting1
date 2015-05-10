# Read the household power consumption database into hpc.df dataframe
hpc.df <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?")

# Convert the date col to Date objects
hpc.df$DateTime <- strptime(paste(hpc.df$Date, hpc.df$Time),
                            format="%d/%m/%Y %H:%M:%S")

# Subset to data between 2007-02-01 & 2007-02-02
hpc.df <- hpc.df[hpc.df$DateTime >= as.POSIXlt("2007-02-01") &
                   hpc.df$DateTime < as.POSIXlt("2007-02-03"),]

# Create the histogram
hist(hpc.df$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",
     main="Global Active Power")

# Redo the above, saving to a PNG instead
png("plot1.png", height = 600, width = 600)
hist(hpc.df$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",
     main="Global Active Power")
dev.off()

