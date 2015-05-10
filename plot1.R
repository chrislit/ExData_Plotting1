# Read the household power consumption database into hpc.df dataframe
hpc.df <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?")

# Convert the date col to Date objects
hpc.df$Date <- as.Date(hpc.df$Date, format = "%d/%m/%Y")

# Subset to data between 2007-02-01 & 2007-02-02
hpc.df <- hpc.df[hpc.df$Date >= as.Date("2007-02-01") &
                   hpc.df$Date <= as.Date("2007-02-02"),]

hist(hpc.df$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",
     main="Global Active Power")

# Save the displayed plot to disk (Yes, I know this is an imperfect copy.)
dev.copy(png, "plot1.png")
dev.off()

