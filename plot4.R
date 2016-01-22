# ============================================================================ #
# File Name            :  plot4.R
# Author               :  Keat Min Chong
# Creation Date        :  01-22-2016
# Date Last Updated    :  01-22-2016     
# ============================================================================ #



# preparing data for plotting, data.txt only contains data for 2-day period
# (01/02 & 02/02) in February, 2007
dat <- read.table('data.txt',header=TRUE,sep=';',stringsAsFactors = FALSE)
#  combining Date and Time Columns nad replacing existing Date field
dat$Date <- paste(dat$Date,dat$Time) 
dat$Time <- NULL # removing Time Column
# covert Date column of data frame to POSIXlt format
dat$Date <- strptime(dat$Date,format = '%d/%m/%Y %H:%M:%S')


# set up 2x2 mfcol
par(mfcol = c(2,2))
# adjust margin for displaying 4 plots
par(mar = c(4,4,1,1))

# creating first line plot on Global_active_power against Date
with(dat, plot(Date,Global_active_power,type='l',xlab="",
               ylab="Global Active Power"))

# creating 2nd line plot on Energy sub metering against Date
# creating blank plot
plot(dat$Date,dat$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
# plotting sub_metering_1
points(dat$Date, dat$Sub_metering_1, col = "black", type='l')
# plotting sub_metering_2
points(dat$Date, dat$Sub_metering_2, col = "red", type='l')
# plotting sub_metering_3
points(dat$Date, dat$Sub_metering_3, col = "blue", type='l')
# create legend with no border
legend("topright", lwd = 1,lty = c(1,1,1) , col = c("black","red","blue"), 
       legend = c("Sub_meeting_1 ","Sub_meeting_2 ","Sub_meeting_3 "),bty='n',cex=0.75)


# creating 3th line plot on Voltage against Date
with(dat, plot(Date,Voltage,type='l',xlab="datetime",
               ylab="Voltage"))

# creating 4th line plot on Global_reactive_power against Date
with(dat, plot(Date,Global_reactive_power,type='l',xlab="datetime"))

# copy final diagram with 4 plots to png file 
dev.copy(device = png,filename="plot4.png", width = 480, height = 480)
dev.off()
