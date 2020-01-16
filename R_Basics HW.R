 #tgpp <- read.csv("./tgpp.csv")
#1.What are the names of the columns in this dataset? 
 #colnames(tgpp)
#2. How many rows and columns does this data set have?
 #dim(tgpp)
#3. What kind of object is each data column? 
 #sapply(tgpp, class)
#4. What are the values of the datafile for rows 1, 5, and 8 at columns 3, 7, and 10?
 #tgpp[c(1, 5, 8), c(3, 7, 10)]
#5. Create a pdf of the relationship between the variables “scale” and “richness”.
 #plot(tgpp$scale, tgpp$richness, xlab = "scale, (m^2)", ylab = "richness")
 #Export -> Save as PDF
#6. What happens to your plot when you set the plot argument log equal to ‘xy’.
 #plot(tgpp$scale, tgpp$richness, xlab = "scale, (m^2)", ylab = "richness", log = "xy")
 #It allows the different sets of data points to become more spread out. 