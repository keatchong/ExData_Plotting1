# ============================================================================ #
# File Name            :  plot2.R
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

# creating line plot Global_active_power against Date
with(dat, plot(Date,Global_active_power,type='l',xlab="",
     ylab="Global Active Power (kilowatts)"))

# copy plot to png file 
dev.copy(device = png,filename="plot2.png", width = 480, height = 480)
dev.off()

