
if(!require(fitdistrplus)) install.packages("fitdistrplus")
library(fitdistrplus)

source("load_data.R", encoding = "UTF-8")
source("summary.R", encoding = "UTF-8")
source("cullen-frey_graph.R", encoding = "UTF-8")

source("transform_and_fitdist.R", encoding = "UTF-8")

## Wykresy dopasowania rozkładów
plot(fit.norm)
plot(fit.unif)
plot(fit.beta)

source("monte_carlo_norm.R", encoding = "UTF-8") ## Monte Carlo dla rozkładu normalnego + dystrybuanta statystyki D + p-value
source("monte_carlo_beta.R", encoding = "UTF-8") ## Monte Carlo dla rozkładu beta + dystrybuanta statystyki D + p-value

source("bootstrap_pdf.R", encoding = "UTF-8")
source("bootstrap_cdf.R", encoding = "UTF-8")
