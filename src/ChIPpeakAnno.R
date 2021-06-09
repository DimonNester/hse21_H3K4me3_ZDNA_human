if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene", force = TRUE)
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")

BiocManager::install("clusterProfiler", force = TRUE)
BiocManager::install("ChIPseeker", force = TRUE)
BiocManager::install("org.Hs.eg.db", force = TRUE)
BiocManager::install("ChIPpeakAnno", force = TRUE)

source("lib.R")

###

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)
library(ChIPpeakAnno)
library(org.Hs.eg.db)

###

peaks <- toGRanges(paste0(DATA_DIR, 'H3K4me3_H1.intersect_with_zhunt.bed'), format="BED")
peaks[1:2]

annoData <- toGRanges(TxDb.Hsapiens.UCSC.hg19.knownGene)
annoData[1:2]


anno <- annotatePeakInBatch(peaks, AnnotationData=annoData, 
                            output="overlapping", 
                            FeatureLocForDistance="TSS",
                            bindingRegion=c(-2000, 300))
data.frame(anno) %>% head()

anno$symbol <- xget(anno$feature, org.Hs.egSYMBOL)
data.frame(anno) %>% head()

anno_df <- data.frame(anno)
write.table(anno_df, file=paste0(DATA_DIR, 'H3K4me3_H1.intersect_with_zhunt.genes.txt'),
            col.names = TRUE, row.names = FALSE, sep = '\t', quote = FALSE)

uniq_genes_df <- unique(anno_df['symbol'])
write.table(uniq_genes_df, file=paste0(DATA_DIR, 'H3K4me3_H1.intersect_with_zhunt.genes_uniq.txt'),
            col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)