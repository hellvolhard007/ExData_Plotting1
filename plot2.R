library("data.table")







EPC <- data.table::fread(input = "household_power_consumption.txt"
                             
                             , na.strings="?"
                             
)




EPC[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]




EPC[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]




EPC <- EPC[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]



png("plot2.png", width=480, height=480)




plot(x = EPC[, dateTime]
     
     , y = EPC[, Global_active_power]
     
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()