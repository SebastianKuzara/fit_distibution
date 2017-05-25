## Bootstrap - dopasowanie danych do dystrybuanty

x <- seq(0, 1, by = 0.01)

boot.beta.cdf <- sapply(1:1000, function(i) {
  s <- sample(norm.rozwody, length(norm.rozwody), replace = TRUE)
  mme <- fitdist(s, "beta", "mme")
  p <- pbeta(x, shape1 = mme$estimate["shape1"], shape2 = mme$estimate["shape2"])
  return(p)
})

plot(x = x, y = boot.beta.cdf[, 1], type = "l", col = rgb(0.8, 0.8, 0.8, alpha = 0.1), ylim = c(0, max(boot.beta.cdf)))
for(i in 2:ncol(boot.beta.cdf)) {
  lines(x = x, y = boot.beta.cdf[, i], col = rgb(.6, .6, .6, .1))
}

cdf.quantiles <- apply(boot.beta.cdf, 1, quantile, c(0.025, 0.5, 0.975))
lines(x = x, y = cdf.quantiles[1, ], col = "red", lty = 2)
lines(x = x, y = cdf.quantiles[3, ], col = "red", lty = 2)
lines(x = x, y = cdf.quantiles[2, ], col = "red")
lines(ecdf(norm.rozwody), pch=16)