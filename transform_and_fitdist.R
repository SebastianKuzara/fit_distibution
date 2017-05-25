## Rozkład beta wymaga danych z przedziału [0; 1] dlatego konieczna jest przeskalowanie danych
divorces$norm.rozwody <- (rozwody-min(rozwody))/(max(rozwody)-min(rozwody))


## Wyznaczmy parametry rozkładów dla rozkładów branych pod uwagę
fit.norm <- fitdist(norm.rozwody, "norm")
fit.unif <- fitdist(norm.rozwody, "unif")
fit.beta <- fitdist(norm.rozwody, "beta", method = "mme")