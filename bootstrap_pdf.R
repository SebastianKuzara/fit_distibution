## Bootstrap - dopasowanie danych do funkcji gęstości

x <- seq(0, 1, by = 0.01)

boot.beta.pdf <- sapply(1:1000, function(i) {
  s <- sample(norm.rozwody, length(norm.rozwody), replace = TRUE)
  mme <- fitdist(s, "beta", method = "mme")
  d <- dbeta(x, shape1 = mme$estimate["shape1"], shape2 = mme$estimate["shape2"])
  return(d)
})

plot(x = x, y = boot.beta.pdf[, 1], type = "l", col = rgb(0.8, 0.8, 0.8, alpha = 0.1), ylim = c(0, max(boot.beta.pdf)))
for(i in 2:ncol(boot.beta.pdf)) {
  lines(x = x, y = boot.beta.pdf[ , i], col = rgb(0.8, 0.8, 0.8, alpha =  0.1))
}

pdf.quantiles <- apply(boot.beta.pdf, 1, quantile, c(0.025, 0.5, 0.975))
lines(x = x, y = pdf.quantiles[1, ], col = "red", lty = 2)
lines(x = x, y = pdf.quantiles[3, ], col = "red", lty = 2)
lines(x = x, y = pdf.quantiles[2, ], col = "red")
lines(density(norm.rozwody))
