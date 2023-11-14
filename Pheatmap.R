#"Usage: Rscript pangenome.plot.R 输入文件的绝对路径 输出的图片名"
if (!requireNamespace('optparse', quietly = TRUE)) {
  install.packages('optparse')}
args<-commandArgs(T)
pangenome <- args[1]
output <-args[2]
pangenome=read.table(pangenome,header = F)
colnames(pangenome)=c("name","number","Core_gene","Pan_gene")
pangenome=pangenome[order(as.numeric(as.vector(pangenome$number))),]
#绘图
png(filename = output,width = 500, height = 500, units = "px",res =72)
plot(c(pangenome$number,pangenome$number),(c(pangenome$Core_gene,pangenome$Pan_gene))/1000,
     ylim=c(15,65),xlim=c(1,9),xlab = "Sample number",ylab = "Family number",
     xaxs="i",yaxs="i",pch=17, cex=1,
     bty="l" ,yaxt="n")
points(pangenome$number, (pangenome$Core_gene)/1000, pch=17, col="indianred3",cex=1)
points(pangenome$number, (pangenome$Pan_gene)/1000, pch=17, col="steelblue",cex=1)
lines(lowess(pangenome$number,(pangenome$Core_gene)/1000),col='indianred3',lwd=1,lty=1)
lines(lowess(pangenome$number,(pangenome$Pan_gene)/1000),col='steelblue',lwd=1,lty=1)
axis(2, at=c(20,30,40,50,60),lab=c("20k","30k","40k","50k","60k"))
legend("left", c("Pan","Core"), cex=1.2, col=c("steelblue","indianred3"), pch=17, bty="n",inset=0.7, lty=1)
dev.off()

##写一个画热图脚步
# Path: pangenome.heatmap.R
#"Usage: Rscript pangenome.heatmap.R 输入文件的绝对路径 输出的图片名"
if (!requireNamespace('optparse', quietly = TRUE)) {
  install.packages('optparse')}
args<-commandArgs(T)
pangenome <- args[1]
output <-args[2]
pangenome=read.table(pangenome,header = F)
colnames(pangenome)=c("name","number","Core_gene","Pan_gene")
pangenome=pangenome[order(as.numeric(as.vector(pangenome$number))),]
#绘图
png(filename = output,width = 500, height = 500, units = "px",res =72)
plot(c(pangenome$number,pangenome$number),(c(pangenome$Core_gene,pangenome$Pan_gene))/1000,
     ylim=c(15,65),xlim=c(1,9),xlab = "Sample number",ylab = "Family number",
     xaxs="i",yaxs="i",pch=17, cex=1,
     bty="l" ,yaxt="n")
points(pangenome$number, (pangenome$Core_gene)/1000, pch=17, col="indianred3",cex=1)
points(pangenome$number, (pangenome$Pan_gene)/1000, pch=17, col="steelblue",cex=1)



