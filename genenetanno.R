args = commandArgs(trailingOnly = TRUE)
parameter1 <- args[1]
parameter2 <- args[2]
id=read.csv(parameter1,sep="\t")
x=read.csv(parameter2)
genes=unique(unlist(strsplit(x$Genes,";")))
geneids=id$GeneID[id$Symbol%in%genes]
if(file.exists("./netcat")==TRUE){cat("netcat Existed!\n")}else{
dir.create("./netcat",recursive=TRUE);cat("netcat Created\n")}
nums=length(geneids)
for(i in 1:nums){print(paste("Running",i,"/",nums));system(paste("netcat.bat",geneids[i]))}
z=readLines("geneinfo")
z=gsub("        ","",z)
z=gsub("<dd>","",z)
z=gsub("</dd>","",z)
z=gsub("<a href=\"#gene-expression\">See more</a>","",z)
pss=grep("df~",z)
zs=paste(z[2:(pss[1]-1)],collapse=";")
for(i in 1:(length(pss)-1)){zs=c(zs,paste(z[(pss[i]+2):(pss[i+1]-1)],collapse=";"))}
zframe=data.frame(geneid=geneids,summary=zs)
pp=id[which(id$GeneID%in%zframe$geneid),]
pp=pp[match(zframe$geneid,pp$GeneID),]
zframe=cbind(pp[,3],zframe,pp[,c(5,7:10)])
colnames(zframe)[1]="Gene"
write.csv(zframe,"genesummary.csv",row.names=F)
file.remove("geneinfo")