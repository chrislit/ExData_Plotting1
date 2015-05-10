# Read the household power consumption database into hpc.df dataframe
hpc.df <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?")

# Convert the date col to Date objects
hpc.df$DateTime <- strptime(paste(hpc.df$Date, hpc.df$Time),
                            format="%d/%m/%Y %H:%M:%S")

# Subset to data between 2007-02-01 & 2007-02-02
hpc.df <- hpc.df[hpc.df$DateTime >= as.POSIXlt("2007-02-01") &
                   hpc.df$DateTime < as.POSIXlt("2007-02-03"),]

# Plot the desired graph
plot(hpc.df$DateTime, hpc.df$Sub_metering_1, type="l",
     ylab = "Energy sub metering", xlab = "")
lines(hpc.df$DateTime, hpc.df$Sub_metering_2, col="red")
lines(hpc.df$DateTime, hpc.df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=names(hpc.df)[7:9])

# Redo the above, saving to a PNG instead
png("plot3.png", height = 600, width = 600)
plot(hpc.df$DateTime, hpc.df$Sub_metering_1, type="l",
     ylab = "Energy sub metering", xlab = "")
lines(hpc.df$DateTime, hpc.df$Sub_metering_2, col="red")
lines(hpc.df$DateTime, hpc.df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=names(hpc.df)[7:9])
dev.off()
