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

NAME <- 'H3K4me3_H1.intersect_with_zhunt'
#NAME <- 'zhunt'
#NAME <- 'H3K4me3_H1.ENCFF408FCY.hg19.filtered'
#NAME <- 'H3K4me3_H1.ENCFF668YOE.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 