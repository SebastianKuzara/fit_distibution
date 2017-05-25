## Podsumowanie danych

attach(divorces)
print(head(divorces))
print(summary(rozwody))
par(mfrow = c(1,2))
boxplot(rozwody)
hist(rozwody)
par(mfrow = c(1,1))
