# Generate two Normally distributed variables
N<-10000
a<-rnorm(N, mean=0, sd=1)
b<-rnorm(N, mean=5, sd=2)

# Compute density
da<-density(a)
db<-density(b)

# Plot density distributions
plot(da, 
  xlim = range(da$x, db$x), 
  ylim = range(da$y, db$y),
  main = "Normal distributions",
  xlab = "Values")
polygon(da, col=rgb(1,0,0,0.2))
polygon(db, col=rgb(0,0,1,0.2))
legend('topright', 
  legend=c('a','b'),
  fill = c(rgb(1,0,0,0.2), rgb(0,0,1,0.2)), 
  bty = 'n',
  border = NA)

