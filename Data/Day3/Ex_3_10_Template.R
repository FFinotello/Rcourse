# Ex. 3.10


# Import data
# ... set the right file path
RPKM<-read.csv("../Data/Day3/GSE36952_RPKM.txt",
  header=1, stringsAsFactors=FALSE, sep="\t")


# Have a look at the first 3 rows in the dataset
head(RPKM, 3)


# Remove duplicated genes and set genes as row names
ind <- which(!duplicated(RPKM[,1]))
RPKM <- RPKM[ind,]
rownames(RPKM) <- RPKM[,1]
RPKM <- RPKM[,-1]


# Open a new png file and organize two subplots
png("../Data/Day3/MAplots.png",
width=480, height=1000, units="px")
par(mfrow=c(2,1))


# Make a MA-plot of M1_1 vs. M1_2
A1 <- ( log2(RPKM[,"M1_1"]+1) + log2(RPKM[,"M1_2"]+1) )/2
M1 <- log2(RPKM[,"M1_1"]+1) - log2(RPKM[,"M1_2"]+1)
plot(A1, M1) # Add more options in "plot" if needed

# Compute the number of points exceeding +/-4
ind1<-which(abs(M1)>4)

# Add more functions to plot additional features
# ...

# Make a MA-plot of M1_1 vs. M2_1
# ... 

# Compute the number of points exceeding +/-4
#...

# Add more functions to plot additional features
# ...


# Close the png file
dev.off()
