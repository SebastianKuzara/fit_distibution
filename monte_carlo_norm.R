## Symulacja Monte Carlo
## Wyznaczanie statystyki testu Kolmogorova-Smirnova dla wskazanych rozkładów

## Symulacja danych za pomocą metody Monte Carlo z dwóch rozkładów branych pod uwagę

## Rozkład normalny
set.seed(123)
ds.norm <- replicate(10000, {
  sym_data <- rnorm(length(norm.rozwody), 
                    mean = fit.norm$estimate["mean"], 
                    sd = fit.norm$estimate["sd"])
  d <- ks.test(sym_data, "pnorm",
               mean = fit.norm$estimate["mean"], 
               sd = fit.norm$estimate["sd"])$statistic
  d
})
plot(ecdf(ds.norm), main = "CDF rozkładu normalnego")

print(
  sum(ds.norm > ks.test(norm.rozwody, "pnorm",
                        mean = fit.norm$estimate["mean"], 
                        sd = fit.norm$estimate["sd"])$statistic)/
    length(ds.norm)
)