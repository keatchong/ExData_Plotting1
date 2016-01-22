# ============================================================================ #
# File Name            :  plot3.R
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

# creating initial blank plotting canvas
plot(dat$Date,dat$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
# plotting sub_metering_1
points(dat$Date, dat$Sub_metering_1, col = "black", type='l')
# plotting sub_metering_2
points(dat$Date, dat$Sub_metering_2, col = "red", type='l')
# plotting sub_metering_3
points(dat$Date, dat$Sub_metering_3, col = "blue", type='l')

# create legend
legend("topright", lwd = 1,lty = c(1,1,1) , col = c("black","red","blue"), 
       legend = c("Sub_meeting_1 ","Sub_meeting_2 ","Sub_meeting_3 "), cex=0.75)

# copy plot to png file 
dev.copy(device = png,filename="plot3.png", width = 480, height = 480)
dev.off()
