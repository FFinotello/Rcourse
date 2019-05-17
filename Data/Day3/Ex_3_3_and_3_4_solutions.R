#------------------------------------------------
# Ex. 3.3
#------------------------------------------------

# Load data from txt file into a data.frame
geneExpr<-read.table("../Data/Day3/GSE75299_PatientFPKM.txt",
  header=1, 
  row.names=1, 
  stringsAsFactors=FALSE, 
  sep="\t")

# Save data.frame into an RData
save(geneExpr, 
  file="../Data/Day3/GSE75299_RNAseq.RData")

#------------------------------------------------
# Ex. 3.4
#------------------------------------------------

# Load the RData object built in the previous ex.
# (it contains the "geneExpr" data.frame)
load("../Data/Day3/GSE75299_RNAseq.RData")

# Initialize the two empty vectors
CD8B_pre<-c()
CD8B_on<-c() 

# FOR each column of "geneExpr"
# (i.e. for each sample)
for (i in 1:ncol(geneExpr)) {
  
  # Save the name of the current column/sample i in "cname"
  cname<-colnames(geneExpr)[i]
  
  # Save the expression value of the CD8B gene
  # in the column/sample sample i in "cexpr"
  cexpr<-geneExpr["CD8B",i]

  # If the current column names contains "baseline"
  # include the current gene expression in "CD8B_pre"
  if (as.logical(length(grep("baseline", cname)))) {
    
    CD8B_pre <- c(CD8B_pre, cexpr)
   
  # If not, include it in "CD8B_on"  
  } else {
    
    CD8B_on <- c(CD8B_on, cexpr)
    
  }
}

# Compute the median of CD8B_pre and CD8B_on
# (here rounded to keep only two decimals)
med_pre <- round(median(CD8B_pre),2)
med_on <- round(median(CD8B_on),2)

# Print results to screen
cat("Median expression value of CD8B:\n")
cat("- Pre-treatment:", med_pre, "\n")
cat("- On-treatment:", med_on, "\n")