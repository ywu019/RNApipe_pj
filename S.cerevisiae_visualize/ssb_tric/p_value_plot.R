getwd()
setwd("C:/Users/123/Desktop/ssb_tric/")
rm(list = ls())
p <- read.csv("P.txt", header = T, quote = "")
p <- as.matrix(p)
p_adjust <- p.adjust(p, method = "BH")
write.table(x = p_adjust, "p_adjust.txt", sep = "\t")


require(ggplot2)
library("reshape2")
library("tidyr")
setwd("C:/Users/123/Desktop/ssb_tric/")
rm(list = ls())
data1 <- read.table("ssb_tric_gene_overlap.txt", header = T, quote = "")
data <- melt(
  data1,                       #待转换的数据集名称
  id.vars = "group",           #要保留的主字段
  variable.name= "type",       #转换后的分类字段名称（维度）
  value.name = "percent"       #转换后的度量值名称
)
ggplot(data, aes(x = group, y = percent, fill = type))+
  geom_bar(stat = "identity")+
  theme(axis.title.x = element_text(size = 12, color = "black"),
        axis.title.y = element_text(size = 12, colour = 'black'),
        axis.text.x = element_text(angle = 45, hjust = 1, 
                                   size = 10, colour = 'black'),
        axis.text.y = element_text(size = 10, colour = 'black'),
        plot.title = element_text(hjust = 0.5),
        legend.title = element_blank())+
  xlab("")+ylab("")+ggtitle("ssb_tric_overlap_percent")
  


















