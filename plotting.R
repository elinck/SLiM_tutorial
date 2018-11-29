library(ggplot2); library(cowplot)

### migration / spatially varied selection
c0 <- read.table("~/Dropbox/SLiM_demo/m0.txt")
c1 <- read.table("~/Dropbox/SLiM_demo/m01.txt")
c2 <- read.table("~/Dropbox/SLiM_demo/m1.txt")
c3 <- read.table("~/Dropbox/SLiM_demo/m3.txt")
c4 <- read.table("~/Dropbox/SLiM_demo/m5.txt")
df0 <- cbind.data.frame(c1, rep("m=0", 100))
colnames(df0) <- c("heterozygosity","rate")
df1 <- cbind.data.frame(c1, rep("m=0.01", 100))
colnames(df1) <- c("heterozygosity","rate")
df2 <- cbind.data.frame(c2, rep("m=0.1", 100))
colnames(df2) <- c("heterozygosity","rate")
df3 <- cbind.data.frame(c3, rep("m=0.3", 100))
colnames(df3) <- c("heterozygosity","rate")
df4 <- cbind.data.frame(c4, rep("m=0.5", 100))
colnames(df4) <- c("heterozygosity","rate")
df <- rbind.data.frame(df0,df1,df2,df3,df4)
a <- ggplot(df, aes(x=rate, y=heterozygosity)) + 
  theme_bw()+
  geom_jitter(shape=16, position=position_jitter(0.2)) +
  geom_boxplot(alpha=0.8) +
  ylab(expression("mean nucleotide diversity"~(pi))) +
  xlab("migration rate")

### varied pop size / spatially varied selection
d1 <- read.table("~/Dropbox/SLiM_demo/n500.txt")
d2 <- read.table("~/Dropbox/SLiM_demo/n250.txt")
d3 <- read.table("~/Dropbox/SLiM_demo/n100.txt")
d4 <- read.table("~/Dropbox/SLiM_demo/n50.txt")
df5 <- cbind.data.frame(d1, rep("n=500", 100))
colnames(df5) <- c("heterozygosity","size")
df6 <- cbind.data.frame(d2, rep("n=250", 100))
colnames(df6) <- c("heterozygosity","size")
df7 <- cbind.data.frame(d3, rep("n=100", 100))
colnames(df7) <- c("heterozygosity","size")
df8 <- cbind.data.frame(d4, rep("n=50", 100))
colnames(df8) <- c("heterozygosity","size")
dfn <- rbind.data.frame(df5,df6,df7,df8)
b <- ggplot(dfn, aes(x=size, y=heterozygosity)) + 
  theme_bw()+
  geom_jitter(shape=16, position=position_jitter(0.2)) +
  #geom_jitter(shape=16, position=position_jitter(0.2), color="#8A008A") +
  geom_boxplot(alpha=0.8) +
  ylab(expression("mean nucleotide diversity"~(pi))) +
  xlab("population size")

plot_grid(a, b)