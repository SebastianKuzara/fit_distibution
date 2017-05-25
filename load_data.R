## Wczytanie danych na temat rozwodów w przekroju Powiatów w 2015 roku
## Rozwody na 1000 mieszkańców

divorces <- read.csv("data/LUDN_3427_CTAB_20170523203746.csv", sep = ";", dec = ",", encoding = "UTF-8", stringsAsFactors = FALSE)
divorces <- divorces[ , -4]
names(divorces) <- c("kod", "powiat", "rozwody")
divorces$kod <- as.character(divorces$kod)