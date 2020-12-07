library(ggplot2)

# Setup
maf_data <- read.delim("~/Workspace/ggplot2-maf/sample.maf", header=TRUE, comment.char="#")

# Plot all variants starting position vs. chromosome
pos_chr <- ggplot(maf_data, aes(x=Chromosome, y=Start_Position)) + 
  labs(title="Starting Position vs. Chromosome", y="Starting Position", x="Chromosome", caption="Variants by Starting Position") +
  geom_point() 
ggsave("pos_chr.png", plot = pos_chr, device = "png", scale = 1, dpi = "retina")


# Plot read depth by variant


# Plot variant type counts by chromosome