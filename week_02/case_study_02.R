


library("tidyverse") #packages installed, ensure they are checked whne running next
library("ggplot2")


dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS_v4/tmp_USW00014733_14_0_1/station.csv"
httr::GET("https://data.giss.nasa.gov/cgi-bin/gistemp/stdata_show_v4.cgi?id=USW00014733&ds=14&dt=1")

#data links to the NASA GISS webpages, read_table() function not executed
#httr creates temporary file, with response on the date, contents, and links to the data source

temp=read_csv(dataurl,
              na="999.90", 
              skip=1, 
              col_names = c("YEAR", "JAN", "FEB", "MAR",
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))
# runs data into columns for year, months, and DFJ onward

View(temp)
summary(temp)

plot1 <- ggplot(temp, aes(x = YEAR, y=JJA)) + geom_path() + geom_smooth() + xlab("Year") + ylab("Mean_Summer_Temperature_(C)") + ggtitle("Mean Summer Temperatures in Buffalo, NY","Summer includes June, July, and August \nData from the Global Historical \nClimate Network Blue Line is a LOESS smooth") 
#continuous function for the requested changes to the ggplot, summer title and sub titled in++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ by ending quotations ",", then new quotations. 
#Other universal method for widows is \n next to the word that you want to break off to preform this function

plot1

#run both plot1 <- and plot run lines for 
ggsave(path = "C:/Users/Owner/OneDrive/Desktop/UB/year 1/geo 511/", filename = "Mean Summer Temp Graph.png")
