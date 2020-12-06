library(ggplot2)

# Setup
# data, aes, geom, coord
maf_data <- read.delim("~/Workspace/ggplot2-maf/sample.maf", header=TRUE, comment.char="#")

# Plot
g <- ggplot(maf_data, aes(x=Chromosome, y=Start_Position))  + geom_point()
print(g) 