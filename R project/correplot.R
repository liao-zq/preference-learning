
install.packages('R.matlab')
library('R.matlab')
path <- system.file("mat-files", package="R.matlab")
pn<-file.path("D:/My laptop/Machine learning/R studio/data","data1.mat") #data.mat from 1 to 3 then generate 3 graphs
interdata<-readMat(pn)
bb<-interdata[[1]]
install.packages('pheatmap')
library(pheatmap)

# colnames(bb, do.NULL = TRUE, prefix = "row")
colnames(bb) <- c("EU","WU","GWP","ET","LO","AD")

# rownames(bb, do.NULL = TRUE, prefix = "row")
rownames(bb) <- c("EU","WU","GWP","ET","LO","AD")

pheatmap(bb,color = colorRampPalette(c("#CC0000","#FF9933","#FFFFCC","white","#CCFFFF","#00CCFF", "#003399"), bias = 1)(200),
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         angle_col = "45",
         # main="C. Alternatives 15 and 16",
         family="times new roman",
         fontsize=8,
         fontsize_row = 10,
         fontsize_col = 10
)

