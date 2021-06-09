
source("lib.R")

###
#NAME <- 'zhunt'
#NAME <- 'H3K4me3_H1.ENCFF408FCY.hg19'
#NAME <- 'H3K4me3_H1.ENCFF408FCY.hg38'
#NAME <- 'H3K4me3_H1.ENCFF668YOE.hg19'
#NAME <- 'H3K4me3_H1.ENCFF668YOE.hg38'
NAME <- 'H3K4me3_H1.intersect_with_zhunt'

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

# hist(bed_df$len)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.png'), path = OUT_DIR)
