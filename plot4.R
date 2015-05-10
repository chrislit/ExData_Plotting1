# Read the household power consumption database into hpc.df dataframe
hpc.df <- read.table(file = "household_power_consumption.txt",
                     sep = ";", header = TRUE, na.strings = "?")

# Convert the date col to Date objects
hpc.df$Date <- as.Date(hpc.df$Date, format = "%d/%m/%Y")

# Subset to data between 2007-02-01 & 2007-02-02
hpc.df <- hpc.df[hpc.df$Date >= as.Date("2007-02-01") &
                   hpc.df$Date <= as.Date("2007-02-02"),]

