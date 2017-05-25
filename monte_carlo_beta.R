## Symulacja Monte Carlo statystyki D
## Rozkład beta
ds.beta <- replicate(10000, {
  sym_data <- rbeta(length(norm.rozwody), 
                    shape1 = fit.beta$estimate["shape1"], 
                    shape2 = fit.beta$estimate["shape2"])
  d <- ks.test(sym_data, "pbeta", 
               shape1 = fit.beta$estimate["shape1"], 
               shape2 = fit.beta$estimate["shape2"])$statistic
  d
})
plot(ecdf(ds.beta), main = "CDF rozkładu beta")

print(
  sum(ds.beta > ks.test(norm.rozwody, "pbeta",
                        shape1 = fit.beta$estimate["shape1"], 
                        shape2 = fit.beta$estimate["shape2"])$statistic)/
    length(ds.norm)
)