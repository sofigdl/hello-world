install.packages("raster")
library(raster)
guatemala<-getData("GADM", country="GTM", level=2) #get country borders, other country codes can ve found in the manual
plot(guatemala)
prec<-getData("worldclim", var="prec",res=.5, lon=-92, lat =18) #get precipitation 
plot(prec)
prec_ger1<- crop(prec,guatemala) #crop precipitacion to extent of guate
spplot(prec_ger1) #plot results
prec_ger2<- mask(prec_ger1, guatemala) #mask precipitacion to extent of guate
spplot(prec_ger2) #plot result
prec_avg<-cellStats(prec_ger2,stat="mean") #extract precipitation average of guate, other statistics possible as well
plot(prec_avg,
     col=12)
