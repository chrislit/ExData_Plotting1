# Read the household power consumption database into hpc.df dataframe
hpc.df <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?")

# Convert the date col to Date objects
hpc.df$datetime <- strptime(paste(hpc.df$Date, hpc.df$Time),
                            format="%d/%m/%Y %H:%M:%S")

# Subset to data between 2007-02-01 & 2007-02-02
hpc.df <- hpc.df[hpc.df$datetime >= as.POSIXlt("2007-02-01") &
                   hpc.df$datetime < as.POSIXlt("2007-02-03"),]

# Set our graph dimensions: 2 x 2 plots
par(mfcol = c(2,2))

# Plot 1 (upper-left)
plot(hpc.df$datetime, hpc.df$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# Plot 2 (lower-left)
plot(hpc.df$datetime, hpc.df$Sub_metering_1, type="l",
     ylab = "Energy sub metering", xlab = "")
lines(hpc.df$datetime, hpc.df$Sub_metering_2, col="red")
lines(hpc.df$datetime, hpc.df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=names(hpc.df)[7:9])

# Plot 3 (upper-right)
with(hpc.df, plot(datetime, Voltage, type = "l"))

# Plot 4 (lower-right)
with(hpc.df, plot(datetime, Global_reactive_power, type = "l"))


# Redo the above, saving to a PNG instead
png("plot4.png", height = 504, width = 504)

# Set our graph dimensions: 2 x 2 plots
par(mfcol = c(2,2))

# Plot 1 (upper-left)
plot(hpc.df$datetime, hpc.df$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# Plot 2 (lower-left)
plot(hpc.df$datetime, hpc.df$Sub_metering_1, type="l",
     ylab = "Energy sub metering", xlab = "")
lines(hpc.df$datetime, hpc.df$Sub_metering_2, col="red")
lines(hpc.df$datetime, hpc.df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       bty="n", legend=names(hpc.df)[7:9])

# Plot 3 (upper-right)
with(hpc.df, plot(datetime, Voltage, type = "l"))

# Plot 4 (lower-right)
with(hpc.df, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
