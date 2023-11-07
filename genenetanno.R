args = commandArgs(trailingOnly = TRUE)
parameter1 <- args[1]
parameter2 <- args[2]
id=read.csv(parameter1,sep="\t")
x=read.csv(parameter2)
genes=unique(unlist(strsplit(x$Genes,";")))
geneids=unique(id$GeneID[id$Symbol%in%genes])
pp=id[which(id$GeneID%in%geneids),]
pp=pp[match(geneids,pp$GeneID),]
if(file.exists("./netcat")==TRUE){cat("netcat Existed!\n")}else{
dir.create("./netcat",recursive=TRUE);cat("netcat Created\n")}
for(i in 1:length(geneids)){cat(paste("Running",i,geneids[i],as.character(pp[i,3]),"Total num:",length(geneids),"\n"));system(paste("netcat.bat",geneids[i]))}
z=readLines("geneinfo")
z=gsub("<dd>","",z)
z=gsub("</dd>","",z)
z=gsub("        ","",z)
z=gsub("<a href=\"#gene-expression\">See more</a>","",z)
pss=grep("df~",z)
zs=paste(z[2:(pss[1]-1)],collapse=";")
if (length(pss)>1) {for(i in 1:(length(pss)-1)){zs=c(zs,paste(z[(pss[i]+2):(pss[i+1]-1)],collapse=";"))}}
zframe=data.frame(geneid=geneids,summary=zs)
zframe=cbind(pp[,3],zframe,pp[,c(5,7:10)])
colnames(zframe)[1]="NCBIGene"
write.csv(zframe,paste(gsub(".csv","",as.character(parameter2)),"genesummary.csv",sep="_"),row.names=F)
file.remove("geneinfo")