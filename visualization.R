library(ggplot2)

# Setup
maf_data <- read.delim("~/Workspace/ggplot2-maf/sorted.maf", 
                       header=TRUE, 
                       comment.char="#",
                       stringsAsFactors=FALSE)

# Pad chromosome column for ggplot x axis sorting
chrom_name <- unique(maf_data$Chromosome)
chrom_name <- as.character(chrom_name)
chrom_name <- chrom_name[1:22]

for(c in chrom_name){
  if(nchar(c)==4){
     f <- substr(c, 4,4)
     f <- paste("chr", "0", f, sep="")
     f <- as.character(f)
     maf_data$Chromosome[maf_data$Chromosome==c] <- f
  } 
}

# Plot by position
options(scipen=999)
#maf_data$Chromose <- factor(maf_data$Chromose, levels = maf_data$Chromose[order(x$val)])
chr_pos <- ggplot(maf_data, aes(x=Chromosome, y=Start_Position)) + 
  labs(title="Chromosome vs. Starting Position", y="Starting Position", x="Chromosome", caption="MAF Variants by Starting Position") +
  scale_x_discrete(guide = guide_axis(n.dodge=2)) +
  geom_point() 
ggsave("chr_pos.png", plot = chr_pos, device = "png", scale = 1, dpi = "retina")
